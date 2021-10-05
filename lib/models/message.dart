enum MessageStatus { SENDING, SENT, DELIVERED, READ, ERROR }
enum MessageType { TEXT, LINK, DOCUMENT, PICTURE, VIDEO }

class Message {
  final int id;
  final String userName;
  final String userAvatarUrl;
  final String message;
  final DateTime messageDate;
  final MessageType type;
  final MessageStatus status;
  final bool byMe;

  Message({
    required this.id,
    required this.userName,
    required this.userAvatarUrl,
    required this.message,
    required this.messageDate,
    this.type = MessageType.TEXT,
    required this.status,
    this.byMe = false,
  });

  Message copyWith({
    int? id,
    String? userName,
    String? userAvatarUrl,
    String? message,
    DateTime? messageDate,
    MessageType? type,
    MessageStatus? status,
    bool? byMe,
  }) {
    return Message(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      userAvatarUrl: userAvatarUrl ?? this.userAvatarUrl,
      message: message ?? this.message,
      messageDate: messageDate ?? this.messageDate,
      type: type ?? this.type,
      status: status ?? this.status,
      byMe: byMe ?? this.byMe,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Message &&
        other.id == id &&
        other.userName == userName &&
        other.userAvatarUrl == userAvatarUrl &&
        other.message == message &&
        other.messageDate == messageDate &&
        other.type == type &&
        other.status == status &&
        other.byMe == byMe;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userName.hashCode ^
        userAvatarUrl.hashCode ^
        message.hashCode ^
        messageDate.hashCode ^
        type.hashCode ^
        status.hashCode ^
        byMe.hashCode;
  }
}

class MessageListView {
  static List<Message> getExampleList() {
    return [
      Message(
        id: 1,
        userName: "",
        userAvatarUrl: "",
        message: "Привет от старых штиблет!",
        messageDate: DateTime(2020, 3, 2, 15, 45, 00),
        status: MessageStatus.READ,
        byMe: true,
      ),
      Message(
        id: 2,
        userName: "Александр Шатунов",
        userAvatarUrl:
            "https://static.wikia.nocookie.net/e4-misfits/images/6/6c/Nathh.jpg/revision/latest/scale-to-width-down/250?cb=20121220194143",
        message: "Здравствуйте, господин хороший!",
        messageDate: DateTime(2021, 3, 2, 16, 03, 00),
        status: MessageStatus.READ,
      ),
      Message(
        id: 3,
        userName: "",
        userAvatarUrl: "",
        message: "Напиши мне что-нить интересное пожалуйст",
        messageDate: DateTime(2021, 3, 2, 16, 03, 02),
        status: MessageStatus.READ,
        byMe: true,
      ),
      Message(
        id: 4,
        userName: "",
        userAvatarUrl: "",
        message: "Очень надо",
        messageDate: DateTime(2021, 3, 3, 16, 03, 02),
        status: MessageStatus.READ,
        byMe: true,
      ),
      Message(
        id: 5,
        userName: "Александр Шатунов",
        userAvatarUrl:
            "https://static.wikia.nocookie.net/e4-misfits/images/6/6c/Nathh.jpg/revision/latest/scale-to-width-down/250?cb=20121220194143",
        message:
            "Я пишу что-то очень интересное, ведь тебе так интересно, что я тебе пишу",
        messageDate: DateTime(2021, 10, 4, 08, 46, 00),
        status: MessageStatus.READ,
      ),
      Message(
        id: 4,
        userName: "",
        userAvatarUrl: "",
        message: "О! спасибо тебе большое",
        messageDate: DateTime(2021, 10, 5, 08, 47, 00),
        status: MessageStatus.READ,
        byMe: true,
      ),
      Message(
        id: 5,
        userName: "",
        userAvatarUrl: "",
        message: "Это Сообщение отправляется",
        messageDate: DateTime(2021, 10, 5, 16, 03, 00),
        status: MessageStatus.SENDING,
        byMe: true,
      ),
      Message(
        id: 6,
        userName: "",
        userAvatarUrl: "",
        message: "Это сообщение отправлено, но еще не прочитано",
        messageDate: DateTime(2021, 10, 5, 16, 03, 00),
        status: MessageStatus.DELIVERED,
        byMe: true,
      ),
      Message(
        id: 7,
        userName: "",
        userAvatarUrl: "",
        message: "Это сообщение прочитано",
        messageDate: DateTime(2021, 10, 5, 16, 03, 00),
        status: MessageStatus.READ,
        byMe: true,
      ),
      Message(
        id: 7,
        userName: "",
        userAvatarUrl: "",
        message: "Это сообщение не отправилось",
        messageDate: DateTime(2021, 10, 5, 16, 03, 00),
        status: MessageStatus.ERROR,
        byMe: true,
      ),
    ];
  }
}
