import 'package:ink_mobile/messenger/model/message.dart';
import 'package:ink_mobile/messenger/model/user.dart';

class CreateMessage {
  final String body;
  final User owner;
  final int chatId;
  final List<int>? readBy;
  final Message? responseTo;
  const CreateMessage(
    this.body,
    this.owner,
    this.chatId, {
    this.responseTo,
    this.readBy,
  });

  Message call() {
    return Message(
      id: DateTime.now().millisecondsSinceEpoch,
      body: body,
      owner: owner,
      chatId: chatId,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
      readBy: readBy ?? [owner.id],
      responseTo: responseTo?.copyWith(responseTo: null),
    );
  }
}
