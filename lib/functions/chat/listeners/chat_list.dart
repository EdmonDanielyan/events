import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/chat/channel_functions.dart';
import 'package:ink_mobile/functions/chat/send_message.dart';
import 'package:ink_mobile/functions/chat/user_functions.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats/chat_list.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

import '../chat_creation.dart';
import 'all.dart';

class ChatListListener {
  final NatsProvider natsProvider;
  final ChatDatabaseCubit chatDatabaseCubit;
  final UserFunctions userFunctions;
  final ChannelFunctions channelFunctions;
  ChatListListener({
    required this.natsProvider,
    required this.chatDatabaseCubit,
    required this.userFunctions,
    required this.channelFunctions,
  });

  NatsListener get natsListener =>
      UseMessageProvider.messageProvider.natsListener;

  Future<void> listenTo(UserTable user) async {
    try {
      final channel = natsProvider.getPrivateUserChatIdList(user.id.toString());
      final sub = await natsProvider.listenChatList(channel);

      if (sub != null) {
        sub.listen((dataMessage) {
          NatsMessage message = natsProvider.parseMessage(dataMessage);
          onMessage(message);
          natsProvider.acknowledge(sub, dataMessage);
          sub.subscription.close();
        });
      }
    } on SubscriptionAlreadyExistException {}
  }

  Future<void> onMessage(NatsMessage message) async {
    final mapPayload = message.payload! as SystemPayload;
    try {
      ChatListFields fields = ChatListFields.fromMap(mapPayload.fields);
      var chats = fields.chats;
      final users = fields.users;
      final participants = fields.participants;
      final messages = fields.messages;
      final channels = fields.channels;

      if (chats.length > 0) {
        chats = chats.reversed.toList();
        _insertChats(chats, messages);
      }

      _insertUsers(users);
      _insertParticipants(participants);
      _insertChannels(channels);
    } on NoSuchMethodError {
      return;
    }
  }

  Future<void> _insertChats(
      List<ChatTable> chats, List<MessageTable> messages) async {
    final storedChats = await chatDatabaseCubit.db.getAllChats();

    for (final chat in chats) {
      bool insert = _chatExistsInStoredChannels(chat, storedChats);

      if (insert) {
        await ChatCreation(chatDatabaseCubit).insertChat(chat);
        await _insertMessages(chat, messages);
      }
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
    await userFunctions.insertUsers(users);
  }

  Future<void> _insertParticipants(List<ParticipantTable> participants) async {
    await userFunctions.insertParticipants(participants);
  }

  Future<void> _insertMessages(
      ChatTable chat, List<MessageTable> messages) async {
    if (messages.isNotEmpty) {
      List<MessageTable> insertMessages =
          messages.where((element) => element.chatId == chat.id).toList();

      SendMessage(chat: chat, chatDatabaseCubit: chatDatabaseCubit)
          .addMessagesIfNotExists(insertMessages);
    }
  }

  Future<void> _insertChannels(List<ChannelTable> channels) async {
    if (channels.isNotEmpty) {
      for (final channel in channels) {
        await channelFunctions.insertOrUpdate(channel);
      }

      natsListener.listenToMyStoredChannels();
    }
  }
}
