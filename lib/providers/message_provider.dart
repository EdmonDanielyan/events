import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/functions/chat/chat_creation.dart';
import 'package:ink_mobile/functions/chat/send_message.dart';
import 'package:ink_mobile/functions/chat/user_functions.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
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

  MessageProvider(this.natsProvider, this.chatDatabaseCubit);

  bool isGroup(ChatTable chat) => chat.participantId == null;

  void init() async {
    UserFunctions(chatDatabaseCubit).addMe();

    _listenToInvitations();
  }

  _listenToInvitations() {
    _subscribeToChannel(
      natsProvider.getInviteUserToJoinChatChannel(JwtPayload.myId),
      _onInviteMessage,
    );
  }

  Future<void> _onInviteMessage(String channel, NatsMessage message) async {
    print("INVITATION");
    print(channel);
    print(message);
  }

  Future<void> _subscribeToChannel(String channel,
      Future<void> Function(String, NatsMessage) function) async {
    await natsProvider.subscribeToChannel(channel, function);
  }

  Future<void> _onMessage(String channel, NatsMessage message) async {
    print(channel);
    print(message);
  }

  Future<ChatTable> createChat(UserTable user) async {
    final chat = await ChatCreation(chatDatabaseCubit).createSingleChat(user);
    final publicChatList = natsProvider.getPublicChatList();
    final privateChat =
        natsProvider.getPrivateUserTextChannel(JwtPayload.myId.toString());
    final chatChannel = "ink.messaging.group.Text." + chat.id;

    await _subscribeToChannel(chatChannel, _onMessage);
    await natsProvider.sendSystemMessageToChannel(
      publicChatList,
      MessageType.ChatList,
      {
        chatChannel: "add",
        "chat_id": chat.id,
        "chat_name": chat.name,
      },
    );

    await natsProvider.sendSystemMessageToChannel(
      privateChat,
      MessageType.ChatList,
      {
        chatChannel: "add",
        "chat_id": chat.id,
        "chat_name": chat.name,
        "owner_id": JwtPayload.myId.toString(),
      },
    );

    await natsProvider.sendTextMessageToChannel(chatChannel, "Привет всем!");
    return chat;
  }

  Future<ChatTable> createGroup(
      {required String name, required List<UserTable> users}) async {
    final chat = await ChatCreation(chatDatabaseCubit)
        .createGroup(name: name, avatar: "", users: users);

    return chat;
  }

  void inviteUserToJoinChat(int userId, String chatId) {
    print(natsProvider.getInviteUserToJoinChatChannel(userId));
    natsProvider.sendSystemMessageToChannel(
      natsProvider.getInviteUserToJoinChatChannel(userId),
      MessageType.InviteUserToJoinChat,
      {"chat_id": chatId},
    );
  }

  void sendMessage(ChatTable chat, ChatEntities chatEntities) {
    String channel = getChannel(chat);
    SendMessage(
      chatDatabaseCubit: chatDatabaseCubit,
      natsProvider: natsProvider,
      chat: chat,
      channelName: channel,
    ).call(chatEntities);
  }

  String getChannel(ChatTable chat) {
    if (isGroup(chat))
      return natsProvider.getPrivateUserTextChannel(chat.id);
    else
      return natsProvider
          .getPrivateUserTextChannel(chat.participantId.toString());
  }
}
