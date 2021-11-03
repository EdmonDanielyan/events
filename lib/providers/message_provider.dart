import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/chat_creation.dart';
import 'package:ink_mobile/functions/chat/listeners/all.dart';
import 'package:ink_mobile/functions/chat/listeners/chat.dart';
import 'package:ink_mobile/functions/chat/listeners/invitation.dart';
import 'package:ink_mobile/functions/chat/channel_functions.dart';
import 'package:ink_mobile/functions/chat/send_message.dart';
import 'package:ink_mobile/functions/chat/sender/send_system_message.dart';
import 'package:ink_mobile/functions/chat/user_functions.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';
import 'package:ink_mobile/screens/messages/chat/entities/form_entities.dart';

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
  late ChatInvitationListener chatInvitationListener;
  late ChatMessageListener chatMessageListener;
  late ChatSendMessage chatSendMessage;
  late ChatCreation chatCreation;
  late UserFunctions userFunctions;
  late NatsListener natsListener;
  late ChannelFunctions channelFunctions;

  MessageProvider(this.natsProvider, this.chatDatabaseCubit) {
    this.userFunctions = UserFunctions(chatDatabaseCubit);
    this.channelFunctions = ChannelFunctions(chatDatabaseCubit);
    this.chatMessageListener = ChatMessageListener(
      natsProvider: natsProvider,
      userFunctions: userFunctions,
      chatDatabaseCubit: chatDatabaseCubit,
    );
    this.chatSendMessage = ChatSendMessage(natsProvider);
    this.chatInvitationListener = ChatInvitationListener(
      natsProvider: natsProvider,
      chatMessageListener: chatMessageListener,
      chatSendMessage: chatSendMessage,
      chatDatabaseCubit: chatDatabaseCubit,
    );
    this.natsListener = NatsListener(
      natsProvider: natsProvider,
      chatDatabaseCubit: chatDatabaseCubit,
      channelFunctions: channelFunctions,
      chatMessageListener: chatMessageListener,
      chatInvitationListener: chatInvitationListener,
    );
    this.chatCreation = ChatCreation(chatDatabaseCubit);
  }

  bool isGroup(ChatTable chat) => chat.participantId == null;

  String get getPublicChatList => natsProvider.getPublicChatIdList();

  String getPrivateTextChannel(String userId) =>
      natsProvider.getPrivateUserTextChannel(userId);

  String getChatChannel(String chatId) =>
      natsProvider.getGroupTextChannel(chatId);

  void init() async {
    UserFunctions(chatDatabaseCubit).addMe();
    natsListener.listenToAllMessages();
    natsListener.listenToMyChannels();
  }

  Future<ChatTable> createChat(UserTable user) async {
    ChatTable? chat;
    List<UserTable> users = [user, UserFunctions.getMe];

    chat = await chatCreation.isChatExists(users);

    if (chat == null) {
      chat = await ChatCreation(chatDatabaseCubit).createSingleChat(user);
      _afterChatCreation(chat, users);
    }

    return chat;
  }

  Future<ChatTable> createGroup(
      {required String name, required List<UserTable> users}) async {
    final chat = await ChatCreation(chatDatabaseCubit)
        .createGroup(name: name, avatar: "", users: users);
    _afterChatCreation(chat, users);
    return chat;
  }

  Future<void> _afterChatCreation(ChatTable chat, List<UserTable> users) async {
    final chatChannel = getChatChannel(chat.id);
    await chatMessageListener.listenTo(chatChannel);

    for (final user in users) {
      if (user.id != JwtPayload.myId) {
        await chatInvitationListener.inviteUser(
          user: user,
          chat: chat,
          chatChannel: chatChannel,
          users: users,
        );
      }
    }

    await chatSendMessage.saveToPrivateUserChatIdList(
        userId: JwtPayload.myId, channel: chatChannel, chat: chat);
  }

  Future<void> sendMessage(ChatTable chat, ChatEntities chatEntities) async {
    await sendTxtMessage(chat, chatEntities);
  }

  Future<void> sendTxtMessage(
    ChatTable chat,
    ChatEntities chatEntities, {
    UserTable? user,
  }) async {
    final message = await SendMessage(
      chatDatabaseCubit: chatDatabaseCubit,
      chat: chat,
    ).call(chatEntities);

    await chatSendMessage.sendTextMessage(
      getChatChannel(chat.id),
      chat,
      message,
      user ?? UserFunctions.getMe,
    );
  }
}
