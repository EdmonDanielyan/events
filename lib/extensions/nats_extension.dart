import 'package:flutter/foundation.dart';

enum MessageType { base, message, binary, system }

extension MessageTypeEx on String {
  MessageType toMessageType() =>
      MessageType.values.firstWhere((d) => describeEnum(d) == toLowerCase());
}

enum SystemMessageType { channels }

extension SystemMessageTypeEx on String {
  SystemMessageType toSystemMessageType() =>
      SystemMessageType.values.firstWhere((d) => describeEnum(d) == toLowerCase());
}