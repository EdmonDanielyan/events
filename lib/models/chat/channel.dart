import 'package:flutter/foundation.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message_list_view.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/token.dart';

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

  static ChannelTable? channelNameToChannel(String name) {
    final messageType = MessageListView.getTypeByChannel(name);
    if (messageType != null) {
      return ChannelTable(
        id: "custom_" + new DateTime.now().toString(),
        payloadType: PayloadType.message,
        needAck: true,
        from: JwtPayload.myId.toString(),
        to: name,
        sequence: "0",
        messageType: messageType,
      );
    }

    return null;
  }

  static bool isChannelInviteUser(String channel) {
    final msg =
        describeEnum(MessageType.InviteUserToJoinChat.toString()).toLowerCase();

    return channel.toLowerCase().contains(msg);
  }
}
