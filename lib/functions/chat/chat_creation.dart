import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/user_functions.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/models/chat/chat_user.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/token.dart';

class ChatCreation {
  final ChatDatabaseCubit chatDatabaseCubit;
  const ChatCreation(this.chatDatabaseCubit);

  static String get generateChatId =>
      "${JwtPayload.myId}_${new DateTime.now().millisecondsSinceEpoch}";

  Future<ChatTable> createDynamically(
      ChatTable chat, List<UserTable> users) async {
    late ChatTable? newChat;

    if (ChatListView.isGroup(chat)) {
      newChat =
          await createGroup(name: chat.name, avatar: chat.avatar, users: users);
    } else {
      newChat = await isChatExists(users);

      if (newChat == null) {
        newChat = await createSingleChat(
          ChatUserViewModel.getNotOwnerFromList(chat, users),
          name: chat.name,
          avatar: chat.avatar,
          users: users,
        );
      }
    }

    return newChat;
  }

  Future<ChatTable> createSingleChat(UserTable user,
      {String? name, String? avatar, List<UserTable>? users}) async {
    users = users ?? [user, UserFunctions.getMe];

    var newChat = _makeChat(
      ChatListView.getChatIdBetweenUsers(users),
      name ?? user.name,
      avatar ?? user.avatar,
      participantId: user.id,
    );

    await _insertChat(newChat);
    await UserFunctions(chatDatabaseCubit).insertUsers(users);

    return newChat;
  }

  Future<ChatTable> createGroup({
    required String name,
    required String avatar,
    required List<UserTable> users,
  }) async {
    var newChat = _makeChat(generateChatId, name, avatar);

    await _insertChat(newChat);
    await UserFunctions(chatDatabaseCubit).insertUsers(users);

    return newChat;
  }

  Future<ChatTable?> isChatExists(List<UserTable> users) async {
    final chats = await _getAllChats;

    for (final chat in chats) {
      String chatId = ChatListView.getChatIdBetweenUsers(users);

      if (chat.id == chatId) return chat;
    }

    return null;
  }

  Future<List<ChatTable>> get _getAllChats async =>
      await chatDatabaseCubit.db.getAllChats();

  ChatTable _makeChat(String id, String name, String avatar,
      {int? participantId}) {
    return ChatTable(
      id: id,
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
