import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/chat_creation.dart';
import 'package:ink_mobile/functions/chat/chat_functions.dart';
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

  void init() async {
    UserFunctions(chatDatabaseCubit).addMe();
    _onMessage();
  }

  void _onMessage() async {
    natsProvider.onMessage = (channel, message) async {
      _hidePingPong(message, () {
        print(channel);
        print(message);
      });
    };
  }

  void _hidePingPong(NatsMessage message, void Function() callback) {
    if (!message.from.contains(JwtPayload.myId.toString())) {
      callback();
    }
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
    SendMessage(
      chatDatabaseCubit: chatDatabaseCubit,
      natsProvider: natsProvider,
      chat: chat,
    ).call(chatEntities);
    ChatFunctions(chatDatabaseCubit).setChatToFirst(chat);
  }
}
