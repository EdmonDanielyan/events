import 'package:injectable/injectable.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/messenger/cases/chat_functions.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/nats/message_status.dart';
import 'package:ink_mobile/messenger/providers/nats_provider.dart';
import 'package:ink_mobile/models/jwt_payload.dart';

@injectable
class UserReactionSender {
  final NatsProvider natsProvider;

  final ChatFunctions chatFunctions;

  UserReactionSender(this.natsProvider, this.chatFunctions);

  Future<bool> sendReadMessageStatus(
      String channel, List<MessageTable> messages,
      {int? userId}) async {
    return await natsProvider.sendSystemMessageToChannel(
      channel,
      MessageType.UserReacted,
      ChatMessageStatusFields(
        senderId: userId ?? JwtPayload.myId,
        messages: messages,
      ).toMap(),
    );
  }

  Future<bool> setMessagesToReadNats(List<MessageTable> messages,
      {bool sendRequest = true}) async {
    String chatId = messages.last.chatId;
    var chatTable = await chatFunctions.chatDatabaseCubit.db.selectChatById(chatId);
    if (chatTable == null) return false;

    final channel = chatTable.channel;
    await chatFunctions.messagesToRead(messages.last, onlyIfMyMessages: false);
    if (sendRequest) {
      bool send = await sendReadMessageStatus(channel, messages);
      if (!send) {
        await chatFunctions.messagesToRead(
          messages.last,
          onlyIfMyMessages: false,
          readStatus: false,
        );
      }
      return send;
    } else {
      return true;
    }
  }
}
