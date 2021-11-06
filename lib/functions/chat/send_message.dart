import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/screens/messages/chat/entities/form_entities.dart';

import 'chat_functions.dart';

class SendMessage {
  final ChatDatabaseCubit chatDatabaseCubit;
  final ChatTable chat;

  const SendMessage({
    required this.chatDatabaseCubit,
    required this.chat,
  });

  static String get generateMessageId =>
      "${JwtPayload.myId}_${new DateTime.now().millisecondsSinceEpoch}";

  Future<MessageTable> call(ChatEntities entities) async {
    final message = await _sendMessageToDatabase(entities);
    return message;
  }

  Future<MessageTable> _sendMessageToDatabase(ChatEntities chatEntities) async {
    MessageTable message = MessageTable(
      id: generateMessageId,
      chatId: chat.id,
      message: chatEntities.text,
      userId: JwtPayload.myId,
      read: false,
      sentOn: false,
      status: MessageStatus.SENDING,
      created: new DateTime.now(),
      repliedMessageId: chatEntities.repliedMessageId,
    );
    await addMessage(message);
    return message;
  }

  Future<int> addMessage(MessageTable message) async {
    final messageId = await chatDatabaseCubit.db.insertMessage(message);
    ChatFunctions(chatDatabaseCubit).setChatToFirst(chat);
    return messageId;
  }
}
