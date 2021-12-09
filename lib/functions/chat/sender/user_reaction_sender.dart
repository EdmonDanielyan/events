import 'package:injectable/injectable.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats/message_status.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

@injectable
class UserReactionSender {
  final NatsProvider natsProvider;

  UserReactionSender(this.natsProvider);

  Future<bool> sendReadMessageStatus(String channel, List<MessageTable> messages,
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
}