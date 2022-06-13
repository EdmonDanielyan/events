import 'package:ink_mobile/messenger/model/message.dart';
import 'package:ink_mobile/messenger/model/user.dart';

class CreateInfoMessage {
  final int chatId;
  final String body;

  const CreateInfoMessage(this.chatId, this.body);

  Message call() {
    return Message(
      body: body,
      owner: const User(id: 0),
      chatId: chatId,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
      type: MessageType.info,
    );
  }
}
