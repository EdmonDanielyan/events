import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/search/data.dart';

class ChatUserSelect extends UserTable {
  final int id;
  final String avatar;
  final String name;
  final bool selected;
  ChatUserSelect({
    required this.id,
    required this.avatar,
    required this.name,
    this.selected = false,
  }) : super(id: id, name: name, avatar: avatar);

  ChatUserSelect copyWith({
    int? id,
    String? avatar,
    String? name,
    bool? selected,
  }) {
    return ChatUserSelect(
      id: id ?? this.id,
      avatar: avatar ?? this.avatar,
      name: name ?? this.name,
      selected: selected ?? this.selected,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatUserSelect &&
        other.id == id &&
        other.avatar == avatar &&
        other.name == name &&
        other.selected == selected;
  }

  @override
  int get hashCode {
    return id.hashCode ^ avatar.hashCode ^ name.hashCode ^ selected.hashCode;
  }
}

class ChatUserSelectViewModel {
  static List<ChatUserSelect> getSelectedItems(List<ChatUserSelect> items) =>
      items.where((element) => element.selected).toList();

  static List<ChatUserSelect> bySearchModel(List<UsersSearchData> items) {
    List<ChatUserSelect> users = [];
    if (items.isNotEmpty) {
      for (final user in items) {
        users.add(
          ChatUserSelect(
            id: user.id,
            avatar: user.avatar,
            name: user.fullName,
          ),
        );
      }
    }
    return users;
  }
}
