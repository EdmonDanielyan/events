import 'package:flutter/foundation.dart';
import 'package:ink_mobile/models/chat/chat_user.dart';
import 'package:ink_mobile/models/chat/group_chat.dart';
import 'package:ink_mobile/models/chat/message.dart';

class Chat {
  final String chatName;
  final String avatarUrl;
  final List<Message> messages;
  final GroupChat? group;

  Chat({
    this.chatName = "",
    required this.avatarUrl,
    required this.messages,
    this.group,
  });

  Chat copyWith({
    String? chatName,
    String? avatarUrl,
    List<Message>? messages,
    GroupChat? group,
  }) {
    return Chat(
      chatName: chatName ?? this.chatName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      messages: messages ?? this.messages,
      group: group ?? this.group,
    );
  }

  @override
  String toString() {
    return 'Chat(chatName: $chatName, avatarUrl: $avatarUrl, messages: $messages, group: $group)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Chat &&
        other.chatName == chatName &&
        other.avatarUrl == avatarUrl &&
        listEquals(other.messages, messages) &&
        other.group == group;
  }

  @override
  int get hashCode {
    return chatName.hashCode ^
        avatarUrl.hashCode ^
        messages.hashCode ^
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
        messages: [
          Message(
            id: 1,
            user: ChatUser(
              avatarUrl:
                  "https://static.wikia.nocookie.net/e4-misfits/images/6/6c/Nathh.jpg/revision/latest/scale-to-width-down/250?cb=20121220194143",
              name: "Василий Шакуров",
              online: true,
            ),
            message: "Привет",
            messageDate: DateTime(2021, 10, 4, 07, 4, 7),
            status: MessageStatus.READ,
          ),
          Message(
            id: 2,
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
        ],
      ),
      Chat(
        chatName: "Катина днюшка",
        avatarUrl:
            "https://upload.wikimedia.org/wikipedia/en/5/5d/Rudy_Wade.jpg",
        messages: [
          Message(
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
        ],
        group: GroupChat(
          description: "Давайте выберем подарок Катюше",
          owner: ChatUser(
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
                  "https://static.wikia.nocookie.net/e4-misfits/images/6/6c/Nathh.jpg/revision/latest/scale-to-width-down/250?cb=20121220194143",
              name: "Елена Юртаева",
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
      ),
      Chat(
        chatName: "Михаил Круг",
        avatarUrl:
            "https://i.pinimg.com/originals/e7/af/05/e7af054c9cb616b59af03ee61bb488a5.jpg",
        messages: [
          Message(
            id: 1,
            user: ChatUser(avatarUrl: "", name: ""),
            message: "Привет от старых штиблет!",
            messageDate: DateTime(2020, 3, 2, 15, 45, 00),
            status: MessageStatus.SENT,
            byMe: true,
          ),
          Message(
            id: 2,
            user: ChatUser(
              avatarUrl:
                  "https://static.wikia.nocookie.net/e4-misfits/images/6/6c/Nathh.jpg/revision/latest/scale-to-width-down/250?cb=20121220194143",
              name: "Александр Шатунов",
            ),
            message: "Здравствуйте, господин хороший!",
            messageDate: DateTime(2021, 3, 2, 16, 03, 00),
            status: MessageStatus.READ,
          ),
          Message(
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
        ],
      ),
      Chat(
        chatName: "Константин Константинов",
        avatarUrl:
            "https://upload.wikimedia.org/wikipedia/en/5/5d/Rudy_Wade.jpg",
        messages: [
          Message(
            id: 3,
            user: ChatUser(avatarUrl: "", name: ""),
            message: "Напиши мне что-нить интересное пожалуйст",
            messageDate: DateTime(2021, 3, 2, 16, 03, 02),
            status: MessageStatus.READ,
            byMe: true,
          ),
          Message(
            id: 4,
            user: ChatUser(avatarUrl: "", name: ""),
            message: "Очень надо",
            messageDate: DateTime(2021, 3, 3, 16, 03, 02),
            status: MessageStatus.READ,
            byMe: true,
          ),
          Message(
            id: 5,
            user: ChatUser(
              avatarUrl:
                  "https://static.wikia.nocookie.net/e4-misfits/images/6/6c/Nathh.jpg/revision/latest/scale-to-width-down/250?cb=20121220194143",
              name: "Александр Шатунов",
            ),
            message:
                "Я пишу что-то очень интересное, ведь тебе так интересно, что я тебе пишу",
            messageDate: DateTime(2021, 10, 4, 08, 46, 00),
            status: MessageStatus.READ,
          ),
          Message(
            id: 4,
            user: ChatUser(avatarUrl: "", name: ""),
            message: "О! спасибо тебе большое",
            messageDate: DateTime(2021, 10, 5, 08, 47, 00),
            status: MessageStatus.READ,
            byMe: true,
          ),
          Message(
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
        ],
      ),
      Chat(
        chatName: "Елена Юртаеваeqeq",
        avatarUrl:
            "https://static.wikia.nocookie.net/e4-misfits/images/6/6c/Nathh.jpg/revision/latest/scale-to-width-down/250?cb=20121220194143",
        messages: [
          Message(
            id: 5,
            user: ChatUser(
              avatarUrl:
                  "https://static.wikia.nocookie.net/e4-misfits/images/6/6c/Nathh.jpg/revision/latest/scale-to-width-down/250?cb=20121220194143",
              name: "Елена Юртаева",
            ),
            message: "Расслабься, дома поговорим",
            messageDate: DateTime(2021, 10, 2, 07, 52),
            status: MessageStatus.READ,
          ),
          Message(
            id: 5,
            user: ChatUser(avatarUrl: "", name: ""),
            message: "Это Сообщение отправляется",
            messageDate: DateTime(2021, 10, 5, 16, 03, 00),
            status: MessageStatus.SENDING,
            byMe: true,
          ),
          Message(
            id: 6,
            user: ChatUser(avatarUrl: "", name: ""),
            message: "Это сообщение отправлено, но еще не прочитано",
            messageDate: DateTime(2021, 10, 5, 16, 03, 00),
            status: MessageStatus.SENT,
            byMe: true,
          ),
          Message(
            id: 7,
            user: ChatUser(avatarUrl: "", name: ""),
            message: "Это сообщение прочитано",
            messageDate: DateTime(2021, 10, 5, 16, 03, 00),
            status: MessageStatus.READ,
            byMe: true,
          ),
          Message(
            id: 7,
            user: ChatUser(avatarUrl: "", name: ""),
            message: "Это сообщение не отправилось",
            messageDate: DateTime(2021, 10, 5, 16, 03, 00),
            status: MessageStatus.ERROR,
            byMe: true,
          ),
          Message(
            id: 10,
            user: ChatUser(avatarUrl: "", name: ""),
            message: "https://google.com",
            messageDate: DateTime(2021, 10, 5, 16, 05, 30),
            status: MessageStatus.SENT,
            byMe: true,
          ),
          Message(
            id: 8,
            user: ChatUser(
              avatarUrl:
                  "https://static.wikia.nocookie.net/e4-misfits/images/6/6c/Nathh.jpg/revision/latest/scale-to-width-down/250?cb=20121220194143",
              name: "Александр Шатунов",
            ),
            message: "Эээээ... Чего?",
            messageDate: DateTime(2021, 10, 6, 16, 05, 00),
            status: MessageStatus.SENT,
          ),
          Message(
            id: 8,
            user: ChatUser(
              avatarUrl:
                  "https://static.wikia.nocookie.net/e4-misfits/images/6/6c/Nathh.jpg/revision/latest/scale-to-width-down/250?cb=20121220194143",
              name: "Александр Шатунов",
            ),
            message: "Just click here https://my.qsoft.ru",
            messageDate: DateTime(2021, 10, 6, 17, 03, 00),
            status: MessageStatus.SENT,
          ),
        ],
      ),
    ];
  }
}
