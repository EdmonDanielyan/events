import 'package:ink_mobile/messenger/model/chat.dart';
import 'package:ink_mobile/messenger/model/user.dart';

class CreateOppositeChat {
  final int chatId;
  final User me;
  final User oppositeUser;
  const CreateOppositeChat(this.chatId, this.oppositeUser, this.me);

  Chat call() {
    return Chat(
      id: chatId,
      name: oppositeUser.name,
      ownerId: me.id,
      avatarUrl: oppositeUser.avatarUrl,
      participants: [oppositeUser, me],
      type: ChatType.single,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
    );
  }
}
