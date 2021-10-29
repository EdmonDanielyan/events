import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/user_functions.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/token.dart';

class ChatCreation {
  final ChatDatabaseCubit chatDatabaseCubit;
  const ChatCreation(this.chatDatabaseCubit);

  static String get generateChatId =>
      "${JwtPayload.myId}_${new DateTime.now().millisecondsSinceEpoch}";

  Future<ChatTable> createSingleChat(UserTable user) async {
    ChatTable? chatExists = await _isChatExists(user);

    if (chatExists != null) {
      return chatExists;
    }

    var newChat = _makeChat(user.name, user.avatar, participantId: user.id);

    await _insertChat(newChat);
    await UserFunctions(chatDatabaseCubit).insertUser(user);

    return newChat;
  }

  Future<ChatTable> createGroup({
    required String name,
    required String avatar,
    required List<UserTable> users,
  }) async {
    var newChat = _makeChat(name, avatar);

    await _insertChat(newChat);
    await UserFunctions(chatDatabaseCubit).insertUsers(users);

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
      id: generateChatId,
      name: name,
      description: "",
      avatar: avatar,
      ownerId: JwtPayload.myId,
      participantId: participantId,
      updatedAt: new DateTime.now(),
    );
  }

  Future<int> _insertChat(ChatTable chat) async {
    return await chatDatabaseCubit.db.insertChat(chat);
  }
}
