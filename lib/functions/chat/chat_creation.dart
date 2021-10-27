import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/message.dart';
import 'package:ink_mobile/models/token.dart';

class ChatCreation {
  final ChatDatabaseCubit chatDatabaseCubit;

  const ChatCreation(this.chatDatabaseCubit);

  Future<ChatTable> createSingleChat(UserTable user) async {
    ChatTable? chatExists = await _isChatExists(user);

    if (chatExists != null) {
      return chatExists;
    }

    final newChat = _makeChat(user.name, user.avatar, participantId: user.id);

    await _insertChat(newChat);
    await _insertUser(user);

    return newChat;
  }

  Future<ChatTable> createGroup({
    required String name,
    required List<UserTable> users,
  }) async {
    final newChat = _makeChat(name, "");

    final chatId = await _insertChat(newChat);
    await _insertUsers(users);

    chatDatabaseCubit.db.insertMessage(
      MessageTable(
        message: "Привет от ${users[0].name}",
        userId: users[0].id,
        chatId: chatId,
        read: false,
        status: MessageStatus.SENDING,
      ),
    );

    return newChat;
  }

  Future<ChatTable?> _isChatExists(UserTable user) async {
    final chats = await _getAllChats;

    for (final chat in chats) {
      if (chat.participantId != null && chat.participantId == user.id)
        return chat;
    }

    return null;
  }

  Future<List<ChatTable>> get _getAllChats async =>
      await chatDatabaseCubit.db.getAllChats();

  ChatTable _makeChat(String name, String avatar, {int? participantId}) {
    return ChatTable(
      name: name,
      avatar: avatar,
      ownerId: JwtPayload.myId,
      participantId: participantId,
      updatedAt: new DateTime.now(),
    );
  }

  Future<int> _insertChat(ChatTable chat) async {
    return await chatDatabaseCubit.db.insertChat(chat);
  }

  Future<int> _insertUser(UserTable user) async {
    UserTable? userExists = await chatDatabaseCubit.db.selectUserById(user.id);
    if (userExists == null) {
      return await chatDatabaseCubit.db.insertUser(user);
    }

    return userExists.id;
  }

  Future<bool> _insertUsers(List<UserTable> users) async {
    for (final user in users) {
      await _insertUser(user);
    }

    return true;
  }
}
