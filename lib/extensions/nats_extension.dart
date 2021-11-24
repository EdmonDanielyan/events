import 'package:flutter/foundation.dart';

enum PayloadType { empty, message, document, system }

extension PayloadTypeEx on String {
  PayloadType toPayloadType() => PayloadType.values
      .firstWhere((d) => describeEnum(d).toLowerCase() == toLowerCase());
}

enum MessageType {
  ChatList,
  InviteUserToJoinChat,
  RequestToJoinChat,
  ApproveUserToJoinChat,
  UpdateChatInfo,
  PinMessage,
  UnpinMessage,
  UpdateUserChatRole,
  Text,
  Document,
  RemoveMessage,
  UpdateMessage,
  UserJoined,
  UserLeftChat,
  UserBanned,
  UserReacted,
  Texting,
  SendingDocument,
  Online
}

extension MessageTypeEx on String {
  MessageType toMessageType() => MessageType.values
      .firstWhere((d) => describeEnum(d).toLowerCase() == toLowerCase());
}
