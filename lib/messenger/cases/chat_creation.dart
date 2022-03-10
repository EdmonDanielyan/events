import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/messenger/blocs/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/messenger/cases/user_functions.dart';
import 'package:ink_mobile/messenger/extensions/chat_table.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat_user.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/models/jwt_payload.dart';
import 'package:ink_mobile/setup.dart';
import 'package:uuid/uuid.dart';

@injectable
class ChatCreation with Loggable {
  final ChatDatabaseCubit chatDatabaseCubit;
  final UserFunctions userFunctions;
  final Messenger messenger;

  ChatCreation(this.chatDatabaseCubit, this.userFunctions, this.messenger);

  String get generateGroupId => "${JwtPayload.myId}-${Uuid().v4()}";

  Future<ChatTable> createDialogChat(UserTable user) async {
    logger.finest('createChatThroughNats');
    List<UserTable> users = [user, userFunctions.me];

    final chat = await _createSingleChat(
      user,
      name: await singleChatName(user),
    );
    _afterNatsChatCreation(chat, users);
    return chat;
  }

  Future<String> singleChatName(UserTable user) async {
    return user.name;
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
      await messenger.registry.subscribeOnChatChannels(chat.channel);
      await messenger.inviteSender.sendInvitations(chat, users);
      await messenger.chatEventsSender.sendUserChatJoinedMessage(
        chat,
        users,
        initiatorId: JwtPayload.myId,
      );
      await messenger.chatSaver.saveChats(newChat: null);
    } else {
      logger.warning('Messenger is not ok. Check network');
    }
  }

  Future<void> createFromInvite(
      ChatTable chat, UserTable whoInvites) async {
    logger.finest('createFromInvite');
    late ChatTable? newChat;

    chatDatabaseCubit.db.insertUserOrUpdate(whoInvites);
    chatDatabaseCubit.db.insertParticipantOrUpdate(ParticipantTable(
        chatId: chat.id,
        userId: whoInvites.id,
        admin: whoInvites.id == chat.ownerId));

    if (chat.isGroup()) {
      logger.finest('createFromInvite: group');

      newChat = await createGroup(
        name: chat.name,
        avatar: chat.avatar,
        users: [],
        chat: chat,
      );
    } else {
      logger.finest('createFromInvite: dialog');
      await chatDatabaseCubit.db.insertChat(chat);
    }
  }

  Future<ChatTable> _createSingleChat(UserTable user,
      {String? name, String? avatar}) async {
    var users = [user, userFunctions.me];

    var chat = await chatDatabaseCubit.db.selectChatByParticipantId(user.id);

    if (chat == null) {
      chat = await _makeChat(
        name ?? user.name,
        avatar ?? user.avatar,
        ownerId: userFunctions.me.id,
        participantId: user.id,
      );

      await chatDatabaseCubit.db.insertChat(chat);
    }
    await UserFunctions(chatDatabaseCubit).insertMultipleUsers(users);

    return chat;
  }

  Future<ChatTable> createGroup({
    required String name,
    required String avatar,
    required List<UserTable> users,
    ChatTable? chat,
  }) async {
    var newChat = chat ?? await _makeChat(name, avatar);

    await chatDatabaseCubit.db.insertChat(newChat);

    final userFunctions = UserFunctions(chatDatabaseCubit);
    await userFunctions.insertMultipleUsers(users);
    await userFunctions.insertMultipleParticipants(
        ChatUserViewModel.toParticipants(users, newChat));

    return newChat;
  }

  Future<List<ChatTable>> getSingleChatsWithUser(UserTable user) async {
    final chats = await chatDatabaseCubit.db.getAllChats();
    List<ChatTable> chatsWithUser = [];

    if (chats.isNotEmpty) {
      for (final chat in chats) {
        if (!chat.isGroup() &&
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
        if (!chat.isGroup() &&
            (chat.ownerId == user.id || chat.participantId == user.id)) {
          return chat;
        }
      }
    }

    return null;
  }

  Future<ChatTable> _makeChat(
    String name,
    String avatar, {
    int? ownerId,
    int? participantId,
  }) async {
    logger.finest(() => "_makeChat: $name, $avatar, $ownerId, $participantId");
    var createChatResponse = await messenger.natsProvider
        .createChat(participantId: participantId?.toString());
    if (createChatResponse == null) throw "Can not create chat";
    return ChatTable(
      id: createChatResponse.chatId,
      name: name,
      description: "",
      avatar: avatar,
      channel: createChatResponse.chatChannel,
      ownerId: ownerId ?? JwtPayload.myId,
      participantId: participantId,
      updatedAt: DateTime.now(),
      notificationsOn: true,
      unreadCounterOn: true,
    );
  }

  Future<void> insertMultipleChats(List<ChatTable> chats) async {
    await chatDatabaseCubit.db.insertMultipleChats(chats);
  }


}
