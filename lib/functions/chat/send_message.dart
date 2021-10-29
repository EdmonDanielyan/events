import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';
import 'package:ink_mobile/screens/messages/chat/entities/form_entities.dart';

class SendMessage {
  final ChatDatabaseCubit chatDatabaseCubit;
  final NatsProvider natsProvider;
  final ChatTable chat;

  const SendMessage({
    required this.chatDatabaseCubit,
    required this.natsProvider,
    required this.chat,
  });

  bool get isGroup => chat.participantId == null;

  void call(ChatEntities entities) {
    _sendMessageToDatabase(entities);
    _sendMessageToNats(entities);
  }

  void _sendMessageToDatabase(ChatEntities chatEntities) {
    chatDatabaseCubit.db.insertMessage(
      MessageTable(
        chatId: chat.id,
        message: chatEntities.text,
        userId: JwtPayload.myId,
        read: false,
        status: MessageStatus.SENDING,
        created: new DateTime.now(),
      ),
    );
  }

  void _sendMessageToNats(ChatEntities chatEntities) {
    natsProvider.sendTextMessageToChannel(
      getChannel(),
      chatEntities.text,
    );
  }

  String getChannel() {
    if (isGroup)
      return natsProvider.getPrivateUserTextChannel(chat.id);
    else
      return natsProvider
          .getPrivateUserTextChannel(chat.participantId.toString());
  }
}
