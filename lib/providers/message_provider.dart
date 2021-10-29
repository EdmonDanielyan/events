import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/chat_creation.dart';
import 'package:ink_mobile/functions/chat/send_message.dart';
import 'package:ink_mobile/functions/chat/user_functions.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
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
  }

  Future<void> _onMessage(String channel, NatsMessage message) async {
    print(channel);
    print(message);
  }

  Future<ChatTable> createChat(UserTable user) async {
    final chat = await ChatCreation(chatDatabaseCubit).createSingleChat(user);

    return chat;
  }

  Future<ChatTable> createGroup(
      {required String name, required List<UserTable> users}) async {
    final chat = await ChatCreation(chatDatabaseCubit)
        .createGroup(name: name, avatar: "", users: users);

    return chat;
  }

  void sendMessage(ChatTable chat, ChatEntities chatEntities) {
    String channel = getChannel(chat);
    SendMessage(
      chatDatabaseCubit: chatDatabaseCubit,
      natsProvider: natsProvider,
      chat: chat,
      channelName: channel,
    ).call(chatEntities);

    //natsProvider.subscribeToChannel(channel, _onMessage);
  }

  String getChannel(ChatTable chat) {
    if (isGroup(chat))
      return natsProvider.getPrivateUserTextChannel(chat.id);
    else
      return natsProvider
          .getPrivateUserTextChannel(chat.participantId.toString());
  }
}
