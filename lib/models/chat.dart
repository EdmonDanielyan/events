import 'package:ink_mobile/models/message.dart';

class Chat {
  final String chatName;

  final String avatarUrl;
  final Message message;
  final bool online;
  final int unreadMessages;
  bool isGroup;

  Chat({
    this.chatName = "",
    required this.avatarUrl,
    required this.message,
    this.online = false,
    this.unreadMessages = 0,
    this.isGroup = false,
  });

  Chat copyWith({
    String? chatName,
    String? avatarUrl,
    Message? message,
    bool? online,
    int? unreadMessages,
    bool? isGroup,
  }) {
    return Chat(
      chatName: chatName ?? this.chatName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      message: message ?? this.message,
      online: online ?? this.online,
      unreadMessages: unreadMessages ?? this.unreadMessages,
      isGroup: isGroup ?? this.isGroup,
    );
  }

  @override
  String toString() {
    return 'Chat(chatName: $chatName, avatarUrl: $avatarUrl, message: $message, online: $online, unreadMessages: $unreadMessages, isGroup: $isGroup)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Chat &&
        other.chatName == chatName &&
        other.avatarUrl == avatarUrl &&
        other.message == message &&
        other.online == online &&
        other.unreadMessages == unreadMessages &&
        other.isGroup == isGroup;
  }

  @override
  int get hashCode {
    return chatName.hashCode ^
        avatarUrl.hashCode ^
        message.hashCode ^
        online.hashCode ^
        unreadMessages.hashCode ^
        isGroup.hashCode;
  }
}

class ChatListView {
  static List<Chat> getExampleList() {
    return [
      Chat(
        chatName: "Василий Шакуров",
        avatarUrl:
            "https://static.wikia.nocookie.net/e4-misfits/images/6/6c/Nathh.jpg/revision/latest/scale-to-width-down/250?cb=20121220194143",
        message: Message(
          id: 1,
          userName: "Василий Шакуров",
          userAvatarUrl:
              "https://static.wikia.nocookie.net/e4-misfits/images/6/6c/Nathh.jpg/revision/latest/scale-to-width-down/250?cb=20121220194143",
          message:
              "Я пишу что-то очень интересное, ведь тебе так интересно, что я тебе пишу",
          messageDate: DateTime(2021, 10, 4, 08, 4, 7),
          status: MessageStatus.SENT,
        ),
        online: true,
        unreadMessages: 7,
      ),
      Chat(
        chatName: "Катина днюшка",
        avatarUrl:
            "https://upload.wikimedia.org/wikipedia/en/5/5d/Rudy_Wade.jpg",
        message: Message(
          id: 2,
          userAvatarUrl:
              "https://upload.wikimedia.org/wikipedia/en/5/5d/Rudy_Wade.jpg",
          userName: "Алексей Иванюк",
          message: "Ахахахахахаха вы уверены?",
          messageDate: DateTime(2021, 10, 4, 08, 32),
          status: MessageStatus.SENT,
        ),
        online: true,
        isGroup: true,
        unreadMessages: 32,
      ),
      Chat(
        chatName: "Михаил Круг",
        avatarUrl:
            "https://i.pinimg.com/originals/e7/af/05/e7af054c9cb616b59af03ee61bb488a5.jpg",
        message: Message(
          id: 3,
          userName: "Михаил Круг",
          userAvatarUrl:
              "https://i.pinimg.com/originals/e7/af/05/e7af054c9cb616b59af03ee61bb488a5.jpg",
          message:
              "Я пишу что-то очень интересное, ведь тебе так интересно, что я тебе пишу",
          messageDate: DateTime(2021, 10, 3, 08, 01),
          status: MessageStatus.DELIVERED,
        ),
        online: false,
        isGroup: false,
        unreadMessages: 0,
      ),
      Chat(
        chatName: "Константин Константинов",
        avatarUrl:
            "https://upload.wikimedia.org/wikipedia/en/5/5d/Rudy_Wade.jpg",
        message: Message(
          id: 4,
          userName: "Константин Константинов",
          userAvatarUrl:
              "https://upload.wikimedia.org/wikipedia/en/5/5d/Rudy_Wade.jpg",
          message:
              "Костя, в фиолетовом кабинете ждет горячая пицца. У меня день рождения!",
          messageDate: DateTime(2021, 10, 3, 07, 52),
          status: MessageStatus.READ,
        ),
        online: true,
        isGroup: false,
        unreadMessages: 0,
      ),
      Chat(
        chatName: "Елена Юртаеваeqeq",
        avatarUrl:
            "https://static.wikia.nocookie.net/e4-misfits/images/6/6c/Nathh.jpg/revision/latest/scale-to-width-down/250?cb=20121220194143",
        message: Message(
          id: 5,
          userName: "Елена Юртаева",
          userAvatarUrl:
              "https://static.wikia.nocookie.net/e4-misfits/images/6/6c/Nathh.jpg/revision/latest/scale-to-width-down/250?cb=20121220194143",
          message: "Расслабься, дома поговорим",
          messageDate: DateTime(2021, 10, 2, 07, 52),
          status: MessageStatus.SENT,
        ),
        online: false,
        isGroup: false,
        unreadMessages: 0,
      ),
    ];
  }
}
