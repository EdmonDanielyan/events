import 'dart:async';

import 'package:collection/collection.dart';
// ignore: implementation_imports
import 'package:dart_nats_streaming/src/data_message.dart';
import 'package:fixnum/fixnum.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/cases/channel_functions.dart';
import 'package:ink_mobile/messenger/cases/user_functions.dart';
import 'package:ink_mobile/messenger/extensions/chat_table.dart';
import 'package:ink_mobile/messenger/listeners/message_listener.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/nats/payloads/chat_list.dart';
import 'package:ink_mobile/messenger/models/chat_list_view.dart';
import 'package:ink_mobile/messenger/models/nats_message.dart';
import 'package:ink_mobile/messenger/providers/nats_provider.dart';
import 'package:ink_mobile/messenger/sender/chat_saver.dart';

import '../../../extensions/participant_list.dart';
import '../../../extensions/user_list.dart';
import '../../../messenger/extensions/chat_list.dart';
import '../cases/chat_creation.dart';
import 'channels_registry.dart';

@Named("ChatList")
@Injectable(as: MessageListener)
class ChatListListener extends MessageListener {
  final ChatDatabaseCubit chatDatabaseCubit;
  final UserFunctions userFunctions;
  final ChannelFunctions channelFunctions;
  final ChatSaver chatSaver;
  final ChatCreation chatCreation;

  ChatListListener(
    NatsProvider natsProvider,
    ChannelsRegistry registry,
    this.chatDatabaseCubit,
    this.userFunctions,
    this.channelFunctions,
    this.chatSaver,
    this.chatCreation,
  ) : super(natsProvider, registry);

  Set<String> busyChannels = {};
  Set<String> _getChatIds = {};

  Future<void> subscribe(String userId) async {
    logger.finest(() => "subscribe: $userId");
    try {
      final channel = natsProvider.getPrivateUserChatIdList();
      final sub = await natsProvider.listenChatList(channel);
      DataMessage? dataMessage;
      try {
        //todo: возможно то что лежит в стриме первым это плохая запись или совсем старая, нельзя на это полагаться
        // Если произошел косяк в локальной базе то последнее сообщение в чат листе битое
        // нужно перечитать весь стрим этого канала и только тогда пристпать к парсингу
        dataMessage = await sub.stream.first.timeout(Duration(seconds: 5));
      } on TimeoutException {
        logger.severe('timeout during read ChatList channel');
      }

      if (dataMessage != null) {
        if (natsProvider.acknowledge(sub, dataMessage)) {
          NatsMessage message = natsProvider.parseMessage(dataMessage);
          await onMessage(channel, message);
          //todo: рано отписываемся по идеи надо прочитать самую валидную для этого клиента запись и потом отписаться
          sub.subscription.close();
        }
      }
    } on SubscriptionAlreadyExistException {
    } catch (_e) {}
  }

  @override
  Future<void> onMessage(String channel, NatsMessage message) async {
    super.onMessage(channel, message);

    final mapPayload = message.payload! as SystemPayload;

    try {
      ChatListPayload fields = ChatListPayload.fromMap(mapPayload.fields);

      var chats = _filterChats(fields.chats);
      final users = fields.users;
      final participants = fields.participants;
      final channels = fields.channels;

      _setLoadingChats(chats);

      //THIS ORDER IS ESSENTIAL (DO NOT CHANGE)
      if (!await _participantsStored(participants)) {
        logger.finest(() => "INSERTING PARTICIPANTS... ${DateTime.now()}");
        await _insertParticipants(participants, chats);
      }

      logger.finest('CHAT LIST STARTING...');
      if (!await _usersStored(users)) {
        logger.finest(() => 'INSERTING USERS... ${DateTime.now()}');
        await _insertUsers(users);
      }

      logger.finest(() => "INSERTING CHATS... ${DateTime.now()}");
      await _insertChats(chats);

      logger.finest(() => "INSERTING CHANNELS... ${DateTime.now()}");
      await _insertChannels(channels);

      if (natsProvider.isConnected) {
        await registry.listenToMyStoredChannels();
      } else {
        throw NoConnectionException(message: "Disconnected");
      }

      await chatSaver.saveChats(newChat: null);

      logger.finest(() => "DONE... ${DateTime.now()}");
    } on NoConnectionException {
      return;
    } on NoSuchMethodError {
      return;
    } catch (_e, stack) {
      logger.severe("Unexpected error", _e, stack);
    }
  }

  List<ChatTable> _filterChats(List<ChatTable> chats) {
    var newChats = chats.cutIdenticalChats();
    _cleanFromDatabase(chats, newChats);

    return newChats.toSet().toList();
  }

  Future<void> _cleanFromDatabase(
      List<ChatTable> originalChats, List<ChatTable> newChats) async {
    if (originalChats.isNotEmpty) {
      for (final chat in originalChats) {
        final getChatFromNew =
            newChats.firstWhereOrNull((element) => element.id == chat.id);

        if (getChatFromNew == null) {
          await chatDatabaseCubit.db.deleteChatById(chat.id);
        }
      }
    }
  }

  Future<void> _setLoadingChats(List<ChatTable> chats) async {
    int chatsLength = 0;
    for (final chat in chats) {
      if (!chat.isGroup() && chat.lastMessageSeq != null) {
        final hasMessages = await chatDatabaseCubit.db.getChatMessages(chat.id);
        if (hasMessages.isEmpty) {
          continue;
        }
      }

      chatsLength++;
    }

    chatDatabaseCubit.setLoadingChatsCounter(chatsLength);
    chatDatabaseCubit.setLoadingChats(false);
    chatDatabaseCubit.setLoadingChats(true);
  }

  Future<bool> _usersStored(List<UserTable> users) async {
    final storedItems = await chatDatabaseCubit.db.getAllUsers();
    return users.compareLight(storedItems);
  }

  Future<bool> _chatsStored(List<ChatTable> chats) async {
    final storedItems = await chatDatabaseCubit.db.getAllChats();
    return chats.compareLight(storedItems);
  }

  Future<bool> _participantsStored(List<ParticipantTable> participants) async {
    final storedItems = await chatDatabaseCubit.db.getAllParticipants();
    return participants.compareLight(storedItems);
  }

  Future<void> _insertChats(List<ChatTable> chats) async {
    if (chats.isEmpty) return;

    chats.sort((a, b) => ChatListView.sortChats(a, b));

    final List<ChatTable> chatsToInsert = [];

    for (final chat in chats) {
      _getChatIds.add(chat.id);
      chatsToInsert.add(chat);
      var channel = chat.channel;
      await registry.subscribeOnChatChannelsIfNotExists(channel,
        sequence: chat.lastMessageSeq != null
            ? Int64.parseInt(chat.lastMessageSeq.toString()).toInt64()
            : Int64.ZERO);
    }
    if (!await _chatsStored(chats)) {
      await chatCreation.insertMultipleChats(chatsToInsert);
    }
  }

  Future<void> _insertUsers(List<UserTable> users) async {
    final distinctUsers = users.toSet().toList();
    await userFunctions.insertMultipleUsers(distinctUsers);
  }

  Future<void> _insertParticipants(
      List<ParticipantTable> participants, List<ChatTable> chats) async {
    var distinctParticipants = _getParticipantThatAreInChats(
      participants,
      chats,
    );
    await userFunctions.insertMultipleParticipants(distinctParticipants);
  }

  List<ParticipantTable> _getParticipantThatAreInChats(
      List<ParticipantTable> participants, List<ChatTable> chats) {
    logger.finest('_getParticipantThatAreInChats');

    var distinctParticipants = participants.toSet().toList();

    distinctParticipants.removeWhere((element) {
      bool _notInChat = true;
      for (final chat in chats) {
        if (chat.id == element.chatId) {
          _notInChat = false;
        }
      }

      return _notInChat;
    });

    return distinctParticipants;
  }

  Future<void> _insertChannels(List<ChannelTable> channels) async {
    if (channels.isNotEmpty) {
      final distinctChannels = _channelFilter(channels);
      _setBusyChannels(distinctChannels);
      for (final channel in distinctChannels) {
        await channelFunctions.insertOrUpdate(channel);
      }
    }
  }

  List<ChannelTable> _channelFilter(List<ChannelTable> channels) {
    logger.finest('_channelFilter');

    var newChannels = channels.toSet().toList();

    return newChannels;
  }

  void _setBusyChannels(List<ChannelTable> channels) {
    logger.finest('_setBusyChannels');
    for (final channel in channels) {
      busyChannels.add(channel.id);
    }
  }
}
