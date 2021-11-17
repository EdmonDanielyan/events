import 'package:ink_mobile/models/chat/database/chat_db.dart';

class ChatInfoEditEntities {
  String avatarUrl;
  String name;
  String description;

  ChatInfoEditEntities(
      {this.avatarUrl = "", this.name = "", this.description = ""});
}

class ChatInfoEditEntitiesFunctions {
  static ChatTable copyChat(ChatInfoEditEntities entities, ChatTable chat) {
    bool isValidAvatar = Uri.parse(entities.avatarUrl).isAbsolute;

    return chat.copyWith(
      avatar: isValidAvatar ? entities.avatarUrl : chat.avatar,
      name: entities.name.isNotEmpty ? entities.name : chat.name,
      description: entities.description.isNotEmpty
          ? entities.description
          : chat.description,
    );
  }
}
