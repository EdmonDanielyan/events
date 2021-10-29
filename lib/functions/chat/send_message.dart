import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';
import 'package:ink_mobile/screens/messages/chat/entities/form_entities.dart';

import 'chat_functions.dart';

class SendMessage {
  final ChatDatabaseCubit chatDatabaseCubit;
  final NatsProvider natsProvider;
  final ChatTable chat;
  final String channelName;

  const SendMessage({
    required this.chatDatabaseCubit,
    required this.natsProvider,
    required this.chat,
    required this.channelName,
  });

  void call(ChatEntities entities) {
    _sendMessageToDatabase(entities);
    _sendMessageToNats(entities);
    ChatFunctions(chatDatabaseCubit).setChatToFirst(chat);
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

  void _sendMessageToNats(ChatEntities entities) {
    natsProvider.sendTextMessageToChannel(
      channelName,
      entities.text,
    );
  }
}
