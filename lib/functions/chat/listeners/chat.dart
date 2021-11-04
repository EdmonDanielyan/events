import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/chat/send_message.dart';
import 'package:ink_mobile/functions/chat/user_functions.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats/message.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

class ChatMessageListener {
  final NatsProvider natsProvider;
  final UserFunctions userFunctions;
  final ChatDatabaseCubit chatDatabaseCubit;

  const ChatMessageListener(
      {required this.natsProvider,
      required this.userFunctions,
      required this.chatDatabaseCubit});

  Future<void> onMessage(String channel, NatsMessage message) async {
    print("ON MESSAGE");
    final mapPayload = message.payload! as SystemPayload;
    ChatMessageFields fields = ChatMessageFields.fromMap(mapPayload.fields);
    if (fields.user.id != JwtPayload.myId) {
      late ChatTable chat =
          ChatListView.changeChatForParticipant(fields.chat, [fields.user]);
      await userFunctions.insertUser(fields.user);
      await SendMessage(chatDatabaseCubit: chatDatabaseCubit, chat: chat)
          .addMessage(fields.message);
    }
  }

  Future<void> listenTo(String channel) async {
    try {
      await natsProvider.subscribeToChannel(channel, onMessage);
    } on SubscriptionAlreadyExistException {}
  }
}
