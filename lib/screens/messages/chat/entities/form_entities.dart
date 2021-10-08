import 'dart:io';

import 'package:ink_mobile/models/chat/chat_user.dart';
import 'package:ink_mobile/models/chat/message.dart';

class ChatEntities {
  String text;
  List<File>? files;
  List<File>? pics_vids;

  ChatEntities({this.text = "", this.files, this.pics_vids});
}

class ChatEntitiesFunctions {
  static MessageType getType(ChatEntities entities) {
    if (entities.pics_vids != null && entities.pics_vids!.length > 0)
      return MessageType.PICTURE_VIDEO;

    if (entities.files != null && entities.files!.length > 0)
      return MessageType.DOCUMENT;

    return MessageType.TEXT;
  }

  static Message buildMessage(ChatEntities entities) {
    return Message(
      id: 8,
      user: ChatUser(avatarUrl: "", name: "IBRA CHEKAEV", online: true),
      message: entities.text,
      messageDate: DateTime.now(),
      type: getType(entities),
      status: MessageStatus.SENDING,
      byMe: true,
    );
  }
}
