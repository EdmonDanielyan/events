import 'package:ink_mobile/models/chat/chat_user.dart';
import 'package:ink_mobile/models/chat/group_chat.dart';

import 'chat.dart';

class ChatUserSelect extends ChatUser {
  final String avatarUrl;
  final bool online;
  final String name;
  final bool selected;
  ChatUserSelect({
    required this.avatarUrl,
    this.online = false,
    required this.name,
    this.selected = false,
  }) : super(avatarUrl: avatarUrl, online: online, name: name);

  ChatUserSelect copyWith({
    String? avatarUrl,
    bool? online,
    String? name,
    bool? selected,
  }) {
    return ChatUserSelect(
      avatarUrl: avatarUrl ?? this.avatarUrl,
      online: online ?? this.online,
      name: name ?? this.name,
      selected: selected ?? this.selected,
    );
  }
}

class ChatUserSelectViewModel {
  static List<ChatUserSelect> getSelectedItems(List<ChatUserSelect> items) =>
      items.where((element) => element.selected).toList();

  static Chat createSingleChat(ChatUserSelect user) {
    return Chat(
      chatName: user.name,
      avatarUrl: user.avatarUrl,
      messages: [],
    );
  }

  static Chat createGroup({
    required String name,
    required ChatUserSelect owner,
    required List<ChatUserSelect> users,
  }) {
    return Chat(
      chatName: name,
      avatarUrl: "",
      messages: [],
      group: GroupChat(owner: owner, users: users),
    );
  }

  static List<ChatUserSelect> getExampleList() {
    return [
      ChatUserSelect(
        avatarUrl:
            "https://static.wikia.nocookie.net/e4-misfits/images/6/6c/Nathh.jpg/revision/latest/scale-to-width-down/250?cb=20121220194143",
        name: "Василий Шакуров",
        online: true,
      ),
      ChatUserSelect(
        avatarUrl:
            "https://upload.wikimedia.org/wikipedia/en/5/5d/Rudy_Wade.jpg",
        name: "Алексей Иванюк",
        online: true,
      ),
      ChatUserSelect(
        avatarUrl:
            "https://i.pinimg.com/originals/e7/af/05/e7af054c9cb616b59af03ee61bb488a5.jpg",
        name: "Михаил Круг",
      ),
      ChatUserSelect(
        avatarUrl:
            "https://static.wikia.nocookie.net/e4-misfits/images/6/6c/Nathh.jpg/revision/latest/scale-to-width-down/250?cb=20121220194143",
        name: "Елена Юртаева",
      ),
      ChatUserSelect(
        avatarUrl:
            "https://upload.wikimedia.org/wikipedia/en/5/5d/Rudy_Wade.jpg",
        name: "Алексей Иванюк",
        online: true,
      ),
      ChatUserSelect(
        avatarUrl:
            "https://upload.wikimedia.org/wikipedia/en/5/5d/Rudy_Wade.jpg",
        name: "Константин Константинов",
      ),
      ////
      ///
      ///
      ChatUserSelect(
        avatarUrl:
            "https://static.wikia.nocookie.net/e4-misfits/images/6/6c/Nathh.jpg/revision/latest/scale-to-width-down/250?cb=20121220194143",
        name: "Елена Юртаева",
      ),
      ChatUserSelect(
        avatarUrl:
            "https://upload.wikimedia.org/wikipedia/en/5/5d/Rudy_Wade.jpg",
        name: "Алексей Иванюк",
        online: true,
      ),
      ChatUserSelect(
        avatarUrl:
            "https://upload.wikimedia.org/wikipedia/en/5/5d/Rudy_Wade.jpg",
        name: "Константин Константинов",
      ),
      ChatUserSelect(
        avatarUrl:
            "https://static.wikia.nocookie.net/e4-misfits/images/6/6c/Nathh.jpg/revision/latest/scale-to-width-down/250?cb=20121220194143",
        name: "Елена Юртаева",
      ),
      ChatUserSelect(
        avatarUrl:
            "https://upload.wikimedia.org/wikipedia/en/5/5d/Rudy_Wade.jpg",
        name: "Алексей Иванюк",
        online: true,
      ),
      ChatUserSelect(
        avatarUrl:
            "https://upload.wikimedia.org/wikipedia/en/5/5d/Rudy_Wade.jpg",
        name: "Константин Константинов",
      ),
    ];
  }
}
