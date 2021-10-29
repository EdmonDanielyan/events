import 'package:flutter/foundation.dart';

enum PayloadType { empty, message, document, system }

extension PayloadTypeEx on String {
  PayloadType toPayloadType() =>
      PayloadType.values.firstWhere((d) => describeEnum(d) == toLowerCase());
}

enum MessageType {
  ChatList,
  InviteUserToJoinChat,
  RequestToJoinChat,
  ApproveUserToJoinChat,
  UpdateChatName,
  PinMessage,
  UnpinMessage,
  UpdateUserChatRole,
  Text,
  Document,
  DeleteMessage,
  UpdateMessage,
  UserJoined,
  UserLeftChat,
  UserBanned,
  UserReacted,
  Texting,
  SendingDocument
}

extension MessageTypeEx on String {
  MessageType toMessageType() =>
      MessageType.values.firstWhere((d) => describeEnum(d) == toLowerCase());
}
