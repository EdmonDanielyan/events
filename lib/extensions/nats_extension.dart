import 'package:flutter/foundation.dart';

enum MessageType { empty, message, document, system }

extension MessageTypeEx on String {
  MessageType toMessageType() =>
      MessageType.values.firstWhere((d) => describeEnum(d) == toLowerCase());
}

enum SystemMessageType {
  // types of NATS messages (please do not change to avoid impact):
  channels,       // list of channel ids for subscription, rights: any
  create_channel, // create channel with settings, rights: admin
  update_channel, // update channel with settings, rights: admin
  delete_channel, // delete channel, rights: admin
  subscribe_to_channel,     // subscribe to Public channel, rights: any
  unsubscribe_from_channel, // unsubscribe from Public channel, rights: any
  update_message, // update message in channel, rights: author of message
  delete_message, // delete message from channel, rights: author of message
  echo_message,   // echo message to channel, rights: any

  // types of Application messages corresponding business logic:
  RequestToJoinChat,
  ConfirmJoinToChat,
  PinMessage,
  UnpinMessage,
  UpdateUserChatRole,
  DeclineChatRequest,
  UserJoined,
  UserLeave,
  UserBanned,
  UserReacted,
  Texting,
  SendingDocument
}

const NATS_SYSTEM_MESSAGE_TYPES = [
  SystemMessageType.channels,
  SystemMessageType.create_channel,
  SystemMessageType.update_channel,
  SystemMessageType.delete_channel,
  SystemMessageType.subscribe_to_channel,
  SystemMessageType.unsubscribe_from_channel,
  SystemMessageType.update_message,
  SystemMessageType.delete_message
];

extension SystemMessageTypeEx on String {
  SystemMessageType toSystemMessageType() => SystemMessageType.values
      .firstWhere((d) => describeEnum(d) == toLowerCase());
}
