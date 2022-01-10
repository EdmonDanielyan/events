import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/user_functions.dart';
import 'package:ink_mobile/models/chat/chat_list_view.dart';
import 'package:ink_mobile/models/chat/chat_user.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/messenger.dart';
import 'package:ink_mobile/setup.dart';
import 'package:uuid/uuid.dart';

@injectable
class ChatCreation with Loggable {
  final ChatDatabaseCubit chatDatabaseCubit;
  final UserFunctions userFunctions;
  final Messenger messenger;

  ChatCreation(this.chatDatabaseCubit, this.userFunctions, this.messenger);

  String get generateGroupId => "${JwtPayload.myId}-${Uuid().v4()}";

  Future<ChatTable> createChatThroughNats(UserTable user) async {
    logger.finest('createChatThroughNats');
    List<UserTable> users = [user, userFunctions.me];

    final chat = await createSingleChat(
      user,
      name: await singleChatName(user),
    );
    _afterNatsChatCreation(chat, users);
    return chat;
  }

  Future<String> singleChatName(UserTable user) async {
    final chats = await getSingleChatsWithUser(user);

    if (chats.length == 0) {
      return user.name;
    }

    return "#${chats.length + 1} ${user.name}";
  }

  Future<ChatTable> createGroupThroughNats(
      {required String name, required List<UserTable> users}) async {
    logger.finest('createGroupThroughNats');
    users.insert(0, userFunctions.me);
    final chat = await sl<ChatCreation>()
        .createGroup(name: name, avatar: "", users: users);
    await _afterNatsChatCreation(chat, users);
    return chat;
  }

  Future<void> _afterNatsChatCreation(
      ChatTable chat, List<UserTable> users) async {
    logger.finest('_afterNatsChatCreation');
    if (messenger.isConnected) {
      logger.finest('Messenger is ok. Preparing channels');
      await messenger.registry.userOnlineListener
          .subscribeToAllAvailableUsers();
      await messenger.registry.subscribeOnChatChannels(chat.id);
      await messenger.inviteSender.sendInvitations(chat, users);
      await messenger.chatSaver.saveChats(newChat: null);
    } else {
      logger.warning('Messenger is not ok. Check network');
    }
  }

  Future<ChatTable> createDynamically(
      ChatTable chat, List<UserTable> users) async {
    late ChatTable? newChat;

    if (ChatListView.isGroup(chat)) {
      newChat = await createGroup(
        name: chat.name,
        avatar: chat.avatar,
        users: users,
        chat: chat,
      );
    } else {
      UserTable oppositeUser = ChatUserViewModel.getOppositeUser(users);

      newChat = chat.copyWith(
        name: await singleChatName(oppositeUser),
        avatar: oppositeUser.avatar,
      );

      await insertChat(newChat, shouldCheck: true);
    }

    return newChat;
  }

  Future<ChatTable> createSingleChat(
    UserTable user, {
    String? chatId,
    String? name,
    String? avatar,
    List<UserTable>? users,
  }) async {
    users = users ?? [user, userFunctions.me];

    String newChatId = chatId ?? generateGroupId;

    ChatTable? chatExists = await isChatExists(newChatId);
    if (chatExists == null) {
      chatExists = _makeChat(
        newChatId,
        name ?? user.name,
        avatar ?? user.avatar,
        participantId: user.id,
      );

      await insertChat(chatExists, shouldCheck: false);
    }
    await UserFunctions(chatDatabaseCubit).insertMultipleUsers(users);

    return chatExists;
  }

  Future<ChatTable> createGroup({
    required String name,
    required String avatar,
    required List<UserTable> users,
    ChatTable? chat,
  }) async {
    var newChat = chat ?? _makeChat(generateGroupId, name, avatar);

    await insertChat(newChat);

    final userFunctions = UserFunctions(chatDatabaseCubit);
    await userFunctions.insertMultipleUsers(users);
    await userFunctions.insertMultipleParticipants(
        ChatUserViewModel.toParticipants(users, newChat));

    return newChat;
  }

  Future<ChatTable?> isChatExists(String id) async {
    final chatExists = await chatDatabaseCubit.db.selectChatById(id);
    return chatExists;
  }

  Future<List<ChatTable>> getSingleChatsWithUser(UserTable user) async {
    final chats = await chatDatabaseCubit.db.getAllChats();
    List<ChatTable> chatsWithUser = [];

    if (chats.isNotEmpty) {
      for (final chat in chats) {
        if (!ChatListView.isGroup(chat) &&
            (chat.ownerId == user.id || chat.participantId == user.id)) {
          chatsWithUser.add(chat);
        }
      }
    }

    return chatsWithUser;
  }

  Future<ChatTable?> isSingleChatExists(UserTable user) async {
    final chats = await chatDatabaseCubit.db.getAllChats();

    if (chats.isNotEmpty) {
      for (final chat in chats) {
        if (!ChatListView.isGroup(chat) &&
            (chat.ownerId == user.id || chat.participantId == user.id)) {
          return chat;
        }
      }
    }

    return null;
  }

  ChatTable _makeChat(
    String id,
    String name,
    String avatar, {
    int? ownerId,
    int? participantId,
  }) {
    return ChatTable(
      id: id,
      name: name,
      description: "",
      avatar: avatar,
      ownerId: ownerId ?? JwtPayload.myId,
      participantId: participantId,
      updatedAt: DateTime.now(),
      millisecondsSinceEpoch: DateTime.now().millisecondsSinceEpoch.toString(),
      notificationsOn: true,
    );
  }

  Future<String> insertChat(ChatTable chat, {bool shouldCheck = true}) async {
    ChatTable? chatExists = shouldCheck ? await isChatExists(chat.id) : null;
    if (chatExists == null) {
      await chatDatabaseCubit.db.insertChat(chat);
    }
    return chat.id;
  }

  Future<void> insertMultipleChats(List<ChatTable> chats) async {
    await chatDatabaseCubit.db.insertMultipleChats(chats);
  }
}
