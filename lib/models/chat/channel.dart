import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';

class ChannelListView {
  static ChannelTable messageNatsToChannel(NatsMessage message) {
    return ChannelTable(
      id: message.to,
      sequence: message.sequence.toInt(),
    );
  }

  static ChannelTable? channelNameToChannel(String name, {Int64? sequence}) {
    return ChannelTable(
      id: name,
      sequence: sequence?.toInt() ?? 0,
    );
  }

  static bool isChannelInviteUser(String channel) {
    final msg =
        describeEnum(MessageType.InviteUserToJoinChat.toString()).toLowerCase();

    return channel.toLowerCase().contains(msg);
  }
}
