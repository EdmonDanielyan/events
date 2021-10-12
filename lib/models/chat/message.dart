import 'package:ink_mobile/models/chat/chat_user.dart';

enum MessageStatus { SENDING, SENT, READ, ERROR }
enum MessageType { TEXT, DOCUMENT, PICTURE_VIDEO }

class Message {
  final int id;
  final ChatUser user;
  final String message;
  final DateTime messageDate;
  final MessageType type;
  final MessageStatus status;
  final bool byMe;

  Message({
    required this.id,
    required this.user,
    required this.message,
    required this.messageDate,
    this.type = MessageType.TEXT,
    this.status = MessageStatus.ERROR,
    this.byMe = false,
  });

  Message copyWith({
    int? id,
    ChatUser? user,
    String? message,
    DateTime? messageDate,
    MessageType? type,
    MessageStatus? status,
    bool? byMe,
  }) {
    return Message(
      id: id ?? this.id,
      user: user ?? this.user,
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
        other.user == user &&
        other.message == message &&
        other.messageDate == messageDate &&
        other.type == type &&
        other.status == status &&
        other.byMe == byMe;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        user.hashCode ^
        message.hashCode ^
        messageDate.hashCode ^
        type.hashCode ^
        status.hashCode ^
        byMe.hashCode;
  }
}

class MessageListView {
  static int unreadMessages(List<Message> items) => items.fold(
        0,
        (previousValue, element) =>
            element.status != MessageStatus.READ && !element.byMe
                ? previousValue + 1
                : previousValue + 0,
      );

  static int sortByDate(Message a, Message b) =>
      a.messageDate.isAfter(b.messageDate) ? -1 : 1;
}
