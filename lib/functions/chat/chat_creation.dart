import 'package:flutter/material.dart';
import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/functions/chat/user_functions.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/chat_list_view.dart';
import 'package:ink_mobile/models/chat/chat_user.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/person_list_params.dart';
import 'package:ink_mobile/models/token.dart';

class ChatCreation {
  final ChatDatabaseCubit chatDatabaseCubit;

  const ChatCreation(this.chatDatabaseCubit);

  static String get generateGroupId =>
      "${JwtPayload.myId}_${new DateTime.now().millisecondsSinceEpoch}";

  static String generateSingleChatId(List<UserTable> users) =>
      ChatListView.getChatIdBetweenUsers(users);

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
      newChat = await isChatExists(chat.id);

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

    String chatId = generateSingleChatId(users);

    ChatTable? chatExists = await isChatExists(chatId);
    if (chatExists == null) {
      chatExists = _makeChat(
        chatId,
        name ?? user.name,
        avatar ?? user.avatar,
        participantId: user.id,
      );

      await insertChat(chatExists, shouldCheck: false);
    }
    await UserFunctions(chatDatabaseCubit).insertUsers(users);

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
    await userFunctions.insertUsers(users);
    await userFunctions.addParticipants(
        ChatUserViewModel.toParticipants(users, newChat), newChat);

    return newChat;
  }

  Future<ChatTable?> isChatExists(String id) async {
    final chatExists = await chatDatabaseCubit.db.selectChatById(id);
    return chatExists;
  }

  ChatTable _makeChat(
    String id,
    String name,
    String avatar, {
    int? participantId,
  }) {
    return ChatTable(
      id: id,
      name: name,
      description: "",
      avatar: avatar,
      ownerId: JwtPayload.myId,
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

  static void sendOn(List<MessageTable> messages, BuildContext context) {
    Future.delayed(Duration(milliseconds: 200), () {
      Navigator.of(context).pushNamed(
        "/message_person_list",
        arguments: PersonListParams(
          messages: messages,
          title: localizationInstance.sendOn,
          type: PersonListParamsEnum.SEND_ON,
        ),
      );
    });
  }
}
