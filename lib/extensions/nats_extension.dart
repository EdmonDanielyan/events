import 'package:flutter/foundation.dart';

enum MessageType { base, simple, binary, system }

extension MessageTypeEx on String {
  MessageType toMessageType() =>
      MessageType.values.firstWhere((d) => describeEnum(d) == toLowerCase());
}

enum SystemMessageType { channels, favorites }

extension SystemMessageTypeEx on String {
  SystemMessageType toSystemMessageType() =>
      SystemMessageType.values.firstWhere((d) => describeEnum(d) == toLowerCase());
}