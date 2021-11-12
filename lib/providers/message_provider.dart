import 'package:ink_mobile/cubit/chat/chat_cubit.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/chat_creation.dart';
import 'package:ink_mobile/functions/chat/chat_functions.dart';
import 'package:ink_mobile/functions/chat/listeners/all.dart';
import 'package:ink_mobile/functions/chat/listeners/chat.dart';
import 'package:ink_mobile/functions/chat/listeners/delete_message.dart';
import 'package:ink_mobile/functions/chat/listeners/invitation.dart';
import 'package:ink_mobile/functions/chat/channel_functions.dart';
import 'package:ink_mobile/functions/chat/listeners/joined.dart';
import 'package:ink_mobile/functions/chat/listeners/left.dart';
import 'package:ink_mobile/functions/chat/listeners/message_status.dart';
import 'package:ink_mobile/functions/chat/listeners/texting.dart';
import 'package:ink_mobile/functions/chat/sender/send_system_message.dart';
import 'package:ink_mobile/functions/chat/user_functions.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:ink_mobile/models/chat/texting.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

import '../setup.dart';

class UseMessageProvider {
  static late MessageProvider messageProvider;

  static void initMessageProvider(
      NatsProvider natsProvider, ChatDatabaseCubit chatDatabaseCubit) {
    messageProvider = MessageProvider(natsProvider, chatDatabaseCubit);
  }
}

class MessageProvider {
  final ChatDatabaseCubit chatDatabaseCubit;
  final NatsProvider natsProvider;
  late ChatFunctions chatFunctions;
  late ChatInvitationListener chatInvitationListener;
  late ChatMessageListener chatMessageListener;
  late ChatSendMessage chatSendMessage;
  late ChatCreation chatCreation;
  late UserFunctions userFunctions;
  late NatsListener natsListener;
  late ChannelFunctions channelFunctions;
  late MessageStatusListener messageStatusListener;
  late MessageTextingListener messageTextingListener;
  late ChatJoinedListener chatJoinedListener;
  late ChatLeftListener chatLeftListener;
  late MessageDeletedListener messageDeletedListener;
  late ChatCubit chatCubit;

  MessageProvider(this.natsProvider, this.chatDatabaseCubit) {
    this.chatCubit = sl.get<ChatCubit>();
    this.userFunctions = UserFunctions(chatDatabaseCubit);
    this.channelFunctions = ChannelFunctions(chatDatabaseCubit);
    this.chatFunctions = ChatFunctions(chatDatabaseCubit);
    this.chatSendMessage = ChatSendMessage(natsProvider);
    this.messageDeletedListener = MessageDeletedListener(
      natsProvider: natsProvider,
      chatFunctions: chatFunctions,
    );
    this.chatJoinedListener = ChatJoinedListener(
      natsProvider: natsProvider,
      userFunctions: userFunctions,
      chatDatabaseCubit: chatDatabaseCubit,
    );
    this.chatLeftListener = ChatLeftListener(
      natsProvider: natsProvider,
      userFunctions: userFunctions,
      chatDatabaseCubit: chatDatabaseCubit,
    );
    this.messageStatusListener = MessageStatusListener(
      natsProvider: natsProvider,
      chatFunctions: chatFunctions,
    );
    this.messageTextingListener = MessageTextingListener(
      natsProvider: natsProvider,
      chatDatabaseCubit: chatDatabaseCubit,
      chatCubit: chatCubit,
    );
    this.chatMessageListener = ChatMessageListener(
      natsProvider: natsProvider,
      userFunctions: userFunctions,
      chatDatabaseCubit: chatDatabaseCubit,
      chatSendMessage: chatSendMessage,
      messageStatusListener: messageStatusListener,
      messageTextingListener: messageTextingListener,
      chatJoinedListener: chatJoinedListener,
      chatLeftListener: chatLeftListener,
      messageDeletedListener: messageDeletedListener,
    );
    this.chatInvitationListener = ChatInvitationListener(
      natsProvider: natsProvider,
      chatSendMessage: chatSendMessage,
      chatDatabaseCubit: chatDatabaseCubit,
    );
    this.natsListener = NatsListener(
      natsProvider: natsProvider,
      channelFunctions: channelFunctions,
      chatMessageListener: chatMessageListener,
      chatInvitationListener: chatInvitationListener,
      messageStatusListener: messageStatusListener,
      messageTextingListener: messageTextingListener,
      chatJoinedListener: chatJoinedListener,
      chatLeftListener: chatLeftListener,
      messageDeletedListener: messageDeletedListener,
    );
    this.chatCreation = ChatCreation(chatDatabaseCubit);
  }

  bool isGroup(ChatTable chat) => chat.participantId == null;

  String get getPublicChatList => natsProvider.getPublicChatIdList();

  String getChatChannel(String chatId) =>
      natsProvider.getGroupTextChannelById(chatId);
  String getMessageStatusChannel(String chatId) =>
      natsProvider.getGroupReactedChannelById(chatId);
  String getTextingChannel(String chatId) =>
      natsProvider.getGroupTextingChannelById(chatId);
  String getUserJoinedChannel(String chatId) =>
      natsProvider.getGroupJoinedChannelById(chatId);
  String getUserLeftChannel(String chatId) =>
      natsProvider.getGroupLeftChannelById(chatId);
  String getDeletedMessageChannel(String chatId) =>
      natsProvider.getGroupDeleteMessageChannelById(chatId);

  void init() async {
    UserFunctions(chatDatabaseCubit).addMe();
    natsListener.init();
    natsListener.listenToAllMessages();
  }

  Future<ChatTable> createChat(UserTable user) async {
    ChatTable? chat;
    List<UserTable> users = [user, UserFunctions.getMe];
    String chatId = ChatCreation.generateSingleChatId(users);
    chat = await chatCreation.isChatExists(chatId);
    if (chat == null) {
      chat = await ChatCreation(chatDatabaseCubit).createSingleChat(user);
      _afterChatCreation(chat, users);
    }

    return chat;
  }

  Future<ChatTable> createGroup(
      {required String name, required List<UserTable> users}) async {
    users.insert(0, UserFunctions.getMe);
    final chat = await ChatCreation(chatDatabaseCubit)
        .createGroup(name: name, avatar: "", users: users);
    _afterChatCreation(chat, users);
    return chat;
  }

  Future<void> _afterChatCreation(ChatTable chat, List<UserTable> users) async {
    natsListener.subscribeOnChatCreate(chat.id);

    await inviteUsers(chat, users);
    await chatSendMessage.saveToPrivateUserChatIdList(
        userId: JwtPayload.myId, channel: getChatChannel(chat.id), chat: chat);
  }

  Future<void> inviteUsers(ChatTable chat, List<UserTable> users) async {
    for (final user in users) {
      if (user.id != JwtPayload.myId) {
        await chatSendMessage.inviteUser(
          user: user,
          chat: chat,
          chatChannel: getChatChannel(chat.id),
          users: users,
        );
      }
    }
  }

  Future<void> sendMessage(ChatTable chat, MessageTable message) async {
    bool success = await sendTxtMessage(chat, message);
    MessageStatus status = success ? MessageStatus.SENT : MessageStatus.ERROR;
    chatFunctions.updateMessageStatus(message, status);
  }

  Future<bool> sendTxtMessage(
    ChatTable chat,
    MessageTable message, {
    UserTable? user,
  }) async {
    return await chatSendMessage.sendTextMessage(
      getChatChannel(chat.id),
      chat,
      message,
      user ?? UserFunctions.getMe,
    );
  }

  Future<void> deleteMessages(List<MessageTable> messages) async {
    if (messages.isNotEmpty) {
      final chatId = messages.last.chatId;
      final channel = getDeletedMessageChannel(chatId);
      final success =
          await chatSendMessage.sendDeleteMessage(channel, messages: messages);

      if (success) chatFunctions.deleteMessages(messages);
    }
  }

  Future<bool> setMessagesToRead(List<MessageTable> messages) async {
    String chatId = messages.last.chatId;
    final channel = getMessageStatusChannel(chatId);
    bool send = await chatSendMessage.sendMessageStatus(channel, messages);
    await MessageStatusListener.messagesToRead(messages, chatFunctions);
    return send;
  }

  Future<bool> sendTextingMessage(
      String chatId, CustomTexting customTexting) async {
    final channel = getTextingChannel(chatId);
    bool send = await chatSendMessage.sendTextingMessage(channel,
        customTexting: customTexting, chatId: chatId);
    return send;
  }

  Future<bool> sendUserJoinedMessage(
      ChatTable chat, List<UserTable> users) async {
    bool send = await chatSendMessage.sendUserJoinedMessage(
      getUserJoinedChannel(chat.id),
      chat: chat,
      users: users,
    );
    return send;
  }

  Future<bool> sendUserLeftMessage(
      ChatTable chat, List<UserTable> users) async {
    bool send = await chatSendMessage.sendUserLeftMessage(
      getUserLeftChannel(chat.id),
      chat: chat,
      users: users,
    );
    return send;
  }
}
