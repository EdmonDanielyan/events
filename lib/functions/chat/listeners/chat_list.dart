import 'dart:async';

import 'package:collection/collection.dart';
// ignore: implementation_imports
import 'package:dart_nats_streaming/src/data_message.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/chat/channel_functions.dart';
import 'package:ink_mobile/functions/chat/listeners/channel_listener.dart';
import 'package:ink_mobile/functions/chat/send_message.dart';
import 'package:ink_mobile/functions/chat/sender/chat_saver.dart';
import 'package:ink_mobile/functions/chat/user_functions.dart';
import 'package:ink_mobile/models/chat/channel.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats/chat_list.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

import '../../../setup.dart';
import '../chat_creation.dart';
import 'channels_registry.dart';

@Named("ChatList")
@Injectable(as: ChannelListener)
class ChatListListener extends ChannelListener {
  final ChatDatabaseCubit chatDatabaseCubit;
  final UserFunctions userFunctions;
  final ChannelFunctions channelFunctions;
  final ChatSaver chatSaver;

  ChatListListener(
    NatsProvider natsProvider,
    ChannelsRegistry registry,
    this.chatDatabaseCubit,
    this.userFunctions,
    this.channelFunctions,
    this.chatSaver,
  ) : super(natsProvider, registry);

  static Set<String> busyChannels = {};
  Set<String> _getChatIds = {};

  Future<void> subscribe(String userId) async {
    logger.finest("subscribe: $userId");
    try {
      final channel = natsProvider.getPrivateUserChatIdList(userId);
      final sub = await natsProvider.listenChatList(channel);
      if (sub != null) {
        DataMessage? dataMessage;
        try {
          //todo: возможно то что лежит в стриме первым это старые чаты, нельзя на это полагаться
          // нужно прочитать весь стрим этого канала и только тогда пристпать к парсингу
          dataMessage = await sub.stream.first
                      .timeout(Duration(seconds: 3));
        } on TimeoutException {
          logger.warning('timeout during read ChatList channel');
        }

        if (dataMessage != null) {
          natsProvider.acknowledge(sub, dataMessage);
          NatsMessage message = natsProvider.parseMessage(dataMessage);
          await onMessage(channel, message);
          //todo: рано отписываемся
          sub.subscription.close();
        }
      }
    } on SubscriptionAlreadyExistException {
    } catch (_e) {
    }
  }

  @override
  Future<void> onMessage(String channel, NatsMessage message) async {
    super.onMessage(channel, message);
    if (!isListeningToChannel(channel)) {
      return;
    }
    final mapPayload = message.payload! as SystemPayload;

    try {
      ChatListFields fields = ChatListFields.fromMap(mapPayload.fields);

      var chats = fields.chats;
      final users = fields.users;
      final participants = fields.participants;
      final messages = fields.messages;
      final channels = fields.channels;

      //SETING LOADER
      chatDatabaseCubit.setLoadingChats(true);

      //THIS ORDER IS ESSENTIAL (DO NOT CHANGE)
      await _insertUsers(users);
      if (chats.length > 0) {
        await _insertChats(chats, messages);
      }
      await _insertParticipants(participants, chats);
      await _insertChannels(channels);

      chatDatabaseCubit.setLoadingChats(false);

      await chatSaver.saveChats(newChat: null);
    } on NoConnectionException {
      return;
    } on NoSuchMethodError {
      return;
    } catch (_e, stack) {
      print("ERROR");
      print(_e.toString());
      print(stack.toString());
    }
  }

  Future<void> _insertChats(
      List<ChatTable> chats, List<MessageTable> messages) async {
    final distinctChats = chats.toSet().toList();

    final storedChats = await chatDatabaseCubit.db.getAllChats();

    distinctChats.sort((a, b) {
      if (messages.isNotEmpty) {
        final messageA =
            messages.lastWhereOrNull((element) => element.chatId == a.id);
        final messageB =
            messages.lastWhereOrNull((element) => element.chatId == b.id);
        if (messageA != null && messageB != null) {
          return messageA.created!.compareTo(messageB.created!);
        }
      }

      return a.updatedAt.compareTo(b.updatedAt);
    });

    for (final chat in distinctChats) {
      _getChatIds.add(chat.id);
      bool insert = _chatExistsInStoredChannels(chat, storedChats);

      if (insert) {
        await sl<ChatCreation>().insertChat(chat);
      }
      await _insertMessages(chat, messages);
    }
  }

  bool _chatExistsInStoredChannels(
      ChatTable chat, List<ChatTable> storedChats) {
    for (final storedChat in storedChats) {
      if (storedChat.id == chat.id) return false;
    }

    return true;
  }

  Future<void> _insertUsers(List<UserTable> users) async {
    final distinctUsers = users.toSet().toList();
    await userFunctions.insertUsers(distinctUsers);
  }

  Future<void> _insertParticipants(
      List<ParticipantTable> participants, List<ChatTable> chats) async {
    var distinctParticipants = _getParticipantThatAreInChats(
      participants,
      chats,
    );
    await userFunctions.insertParticipants(distinctParticipants);
  }

  List<ParticipantTable> _getParticipantThatAreInChats(
      List<ParticipantTable> participants, List<ChatTable> chats) {
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

  Future<void> _insertMessages(
      ChatTable chat, List<MessageTable> messages) async {
    if (messages.isNotEmpty) {
      final distinctMessages = messages.toSet().toList();
      List<MessageTable> insertMessages = distinctMessages
          .where((element) => element.chatId == chat.id)
          .toList();

      if (insertMessages.isNotEmpty) {
        try {
          await SendMessage(chat: chat, chatDatabaseCubit: chatDatabaseCubit)
              .addMessagesIfNotExists(insertMessages);
        } catch (e) {
          print("ERROR ${e.toString()}");
        }
      }
    }
  }

  Future<void> _insertChannels(List<ChannelTable> channels) async {
    if (channels.isNotEmpty) {
      final distinctChannels = _channelFilter(channels);
      _setBusyChannels(distinctChannels);
      for (final channel in distinctChannels) {
        await channelFunctions.insertOrUpdate(channel);
      }

      if (natsProvider.isConnected) {
        await registry.listenToMyStoredChannels();
      } else {
        throw NoConnectionException(message: "Disconnected");
      }
    }
  }

  List<ChannelTable> _channelFilter(List<ChannelTable> channels) {
    var newChannels = channels.toSet().toList();
    newChannels = _clearFromOtherInviteUserChannels(newChannels);
    newChannels = _clearFromNotExistingChats(newChannels);

    return newChannels;
  }

  List<ChannelTable> _clearFromOtherInviteUserChannels(
      List<ChannelTable> channels) {
    channels = channels
      ..removeWhere(
        (element) {
          bool inviteUserChannel =
              ChannelListView.isChannelInviteUser(element.to);
          if (inviteUserChannel && element.to != registry.inviteUserChannel) {
            return true;
          }

          return false;
        },
      );

    return channels;
  }

  List<ChannelTable> _clearFromNotExistingChats(List<ChannelTable> channels) {
    channels = channels
      ..removeWhere((element) {
        bool delete = false;
        final thisChannel = element.to.toLowerCase();
        bool isChatChannel = thisChannel.contains(GROUP_CHANNEL);
        if (isChatChannel) {
          delete = true;
          _getChatIds.forEach((element) {
            if (thisChannel.contains(element.toLowerCase())) {
              delete = false;
            }
          });
          return delete;
        }

        return delete;
      });

    return channels;
  }

  void _setBusyChannels(List<ChannelTable> channels) {
    for (final channel in channels) {
      busyChannels.add(channel.to);
    }
  }
}
