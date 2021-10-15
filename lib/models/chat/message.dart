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
  final int? selectedMessageId;
  final bool byMe;

  Message({
    required this.id,
    required this.user,
    required this.message,
    required this.messageDate,
    this.type = MessageType.TEXT,
    this.status = MessageStatus.ERROR,
    this.selectedMessageId,
    this.byMe = false,
  });

  Message copyWith({
    int? id,
    ChatUser? user,
    String? message,
    DateTime? messageDate,
    MessageType? type,
    MessageStatus? status,
    int? selectedMessageId,
    bool? byMe,
  }) {
    return Message(
      id: id ?? this.id,
      user: user ?? this.user,
      message: message ?? this.message,
      messageDate: messageDate ?? this.messageDate,
      type: type ?? this.type,
      status: status ?? this.status,
      selectedMessageId: selectedMessageId ?? this.selectedMessageId,
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
        other.selectedMessageId == selectedMessageId &&
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
        selectedMessageId.hashCode ^
        byMe.hashCode;
  }
}

class MessageListView {
  static List<Message> searchMessagesByStr(
      String value, List<Message> messages) {
    List<Message> search = [];
    if (value.trim().isNotEmpty) {
      search = messages.where((element) {
        bool byBody =
            element.message.toLowerCase().contains(value.toLowerCase());

        return byBody;
      }).toList();
    }
    return search;
  }

  static Message? getMessageById(int id, List<Message> messages) {
    for (final message in messages) if (message.id == id) return message;

    return null;
  }

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
