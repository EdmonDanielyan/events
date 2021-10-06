import 'package:ink_mobile/models/chat/chat_user.dart';
import 'package:ink_mobile/models/chat/group_chat.dart';
import 'package:ink_mobile/models/chat/message.dart';

class Chat {
  final String chatName;
  final String avatarUrl;
  final Message message;
  final int unreadMessages;
  final GroupChat? group;

  Chat({
    this.chatName = "",
    required this.avatarUrl,
    required this.message,
    this.unreadMessages = 0,
    this.group,
  });

  Chat copyWith({
    String? chatName,
    String? avatarUrl,
    Message? message,
    int? unreadMessages,
    GroupChat? group,
  }) {
    return Chat(
      chatName: chatName ?? this.chatName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      message: message ?? this.message,
      unreadMessages: unreadMessages ?? this.unreadMessages,
      group: group ?? this.group,
    );
  }

  @override
  String toString() {
    return 'Chat(chatName: $chatName, avatarUrl: $avatarUrl, message: $message, unreadMessages: $unreadMessages, group: $group)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Chat &&
        other.chatName == chatName &&
        other.avatarUrl == avatarUrl &&
        other.message == message &&
        other.unreadMessages == unreadMessages &&
        other.group == group;
  }

  @override
  int get hashCode {
    return chatName.hashCode ^
        avatarUrl.hashCode ^
        message.hashCode ^
        unreadMessages.hashCode ^
        group.hashCode;
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
          user: ChatUser(
            avatarUrl:
                "https://static.wikia.nocookie.net/e4-misfits/images/6/6c/Nathh.jpg/revision/latest/scale-to-width-down/250?cb=20121220194143",
            name: "Василий Шакуров",
            online: true,
          ),
          message:
              "Я пишу что-то очень интересное, ведь тебе так интересно, что я тебе пишу",
          messageDate: DateTime(2021, 10, 4, 08, 4, 7),
          status: MessageStatus.SENT,
        ),
        unreadMessages: 7,
      ),
      Chat(
        chatName: "Катина днюшка",
        avatarUrl:
            "https://upload.wikimedia.org/wikipedia/en/5/5d/Rudy_Wade.jpg",
        message: Message(
          id: 2,
          user: ChatUser(
            avatarUrl:
                "https://upload.wikimedia.org/wikipedia/en/5/5d/Rudy_Wade.jpg",
            name: "Алексей Иванюк",
            online: true,
          ),
          message: "Ахахахахахаха вы уверены?",
          messageDate: DateTime(2021, 10, 4, 08, 32),
          status: MessageStatus.SENT,
        ),
        group: GroupChat(
          creator: ChatUser(
            avatarUrl:
                "https://upload.wikimedia.org/wikipedia/en/5/5d/Rudy_Wade.jpg",
            name: "Алексей Иванюк",
            online: true,
          ),
          admins: [
            ChatUser(
              avatarUrl:
                  "https://i.pinimg.com/originals/e7/af/05/e7af054c9cb616b59af03ee61bb488a5.jpg",
              name: "Михаил Круг",
            ),
            ChatUser(
              avatarUrl:
                  "https://upload.wikimedia.org/wikipedia/en/5/5d/Rudy_Wade.jpg",
              name: "Алексей Иванюк",
              online: true,
            ),
          ],
          users: [
            ChatUser(
              avatarUrl:
                  "https://upload.wikimedia.org/wikipedia/en/5/5d/Rudy_Wade.jpg",
              name: "Алексей Иванюк",
              online: true,
            ),
            ChatUser(
              avatarUrl:
                  "https://i.pinimg.com/originals/e7/af/05/e7af054c9cb616b59af03ee61bb488a5.jpg",
              name: "Михаил Круг",
            ),
            ChatUser(
              avatarUrl:
                  "https://upload.wikimedia.org/wikipedia/en/5/5d/Rudy_Wade.jpg",
              name: "Константин Константинов",
            ),
            ChatUser(
              avatarUrl:
                  "https://static.wikia.nocookie.net/e4-misfits/images/6/6c/Nathh.jpg/revision/latest/scale-to-width-down/250?cb=20121220194143",
              name: "Елена Юртаева",
            ),
          ],
        ),
        unreadMessages: 32,
      ),
      Chat(
        chatName: "Михаил Круг",
        avatarUrl:
            "https://i.pinimg.com/originals/e7/af/05/e7af054c9cb616b59af03ee61bb488a5.jpg",
        message: Message(
          id: 3,
          user: ChatUser(
            avatarUrl:
                "https://i.pinimg.com/originals/e7/af/05/e7af054c9cb616b59af03ee61bb488a5.jpg",
            name: "Михаил Круг",
          ),
          message:
              "Я пишу что-то очень интересное, ведь тебе так интересно, что я тебе пишу",
          messageDate: DateTime(2021, 10, 3, 08, 01),
          status: MessageStatus.SENT,
        ),
        unreadMessages: 0,
      ),
      Chat(
        chatName: "Константин Константинов",
        avatarUrl:
            "https://upload.wikimedia.org/wikipedia/en/5/5d/Rudy_Wade.jpg",
        message: Message(
          id: 4,
          user: ChatUser(
            avatarUrl:
                "https://upload.wikimedia.org/wikipedia/en/5/5d/Rudy_Wade.jpg",
            name: "Константин Константинов",
          ),
          message:
              "Костя, в фиолетовом кабинете ждет горячая пицца. У меня день рождения!",
          messageDate: DateTime(2021, 10, 3, 07, 52),
          status: MessageStatus.READ,
        ),
        unreadMessages: 0,
      ),
      Chat(
        chatName: "Елена Юртаеваeqeq",
        avatarUrl:
            "https://static.wikia.nocookie.net/e4-misfits/images/6/6c/Nathh.jpg/revision/latest/scale-to-width-down/250?cb=20121220194143",
        message: Message(
          id: 5,
          user: ChatUser(
            avatarUrl:
                "https://static.wikia.nocookie.net/e4-misfits/images/6/6c/Nathh.jpg/revision/latest/scale-to-width-down/250?cb=20121220194143",
            name: "Елена Юртаева",
          ),
          message: "Расслабься, дома поговорим",
          messageDate: DateTime(2021, 10, 2, 07, 52),
          status: MessageStatus.SENT,
        ),
        unreadMessages: 0,
      ),
    ];
  }
}
