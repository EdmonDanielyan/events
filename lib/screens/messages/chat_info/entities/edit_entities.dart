import 'package:ink_mobile/models/chat/chat.dart';

class ChatInfoEditEntities {
  String name;
  String description;

  ChatInfoEditEntities({this.name = "", this.description = ""});
}

class ChatInfoEditEntitiesFunctions {
  static Chat copyChat(ChatInfoEditEntities entities, Chat chat) {
    return chat.copyWith(
      chatName: entities.name.isNotEmpty ? entities.name : chat.chatName,
      group: chat.group != null
          ? chat.group!.copyWith(description: entities.description)
          : null,
    );
  }
}
