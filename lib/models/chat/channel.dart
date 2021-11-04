import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';

class ChannelListView {
  static ChannelTable messageNatsToChannel(NatsMessage message) {
    final payload = message.payload as SystemPayload;
    return ChannelTable(
      id: message.id,
      payloadType: message.type,
      needAck: message.needAck,
      from: message.from,
      to: message.to,
      sequence: message.sequence.toString(),
      messageType: payload.type,
    );
  }
}
