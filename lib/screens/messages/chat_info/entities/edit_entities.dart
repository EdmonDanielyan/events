import 'package:ink_mobile/models/chat/database/chat_db.dart';

class ChatInfoEditEntities {
  String name;
  String description;

  ChatInfoEditEntities({this.name = "", this.description = ""});
}

class ChatInfoEditEntitiesFunctions {
  static ChatTable copyChat(ChatInfoEditEntities entities, ChatTable chat) {
    return chat.copyWith(
      name: entities.name.isNotEmpty ? entities.name : chat.name,
      description: entities.description.isNotEmpty
          ? entities.description
          : chat.description,
    );
  }
}
