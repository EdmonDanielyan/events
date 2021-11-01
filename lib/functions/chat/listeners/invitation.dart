import 'dart:convert';

import 'package:ink_mobile/cubit/chat_db/chat_table_cubit.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/functions/chat/chat_creation.dart';
import 'package:ink_mobile/functions/chat/listeners/chat.dart';
import 'package:ink_mobile/functions/chat/sender/send_system_message.dart';
import 'package:ink_mobile/models/chat/chat.dart';
import 'package:ink_mobile/models/chat/chat_user.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

class ChatInvitationListener {
  final NatsProvider natsProvider;
  final ChatMessageListener chatMessageListener;
  final ChatSendMessage chatSendMessage;
  final ChatDatabaseCubit chatDatabaseCubit;

  const ChatInvitationListener({
    required this.natsProvider,
    required this.chatMessageListener,
    required this.chatSendMessage,
    required this.chatDatabaseCubit,
  });

  String get channel => natsProvider.getInvitations(JwtPayload.myId);

  Future<void> listen() async {
    await natsProvider.subscribeToChannel(channel, onMessage);
  }

  Future<void> onMessage(String channel, NatsMessage message) async {
    print("ON INVITATION");
    final mapPayload = message.payload! as SystemPayload;
    ChatInvitationFields fields =
        ChatInvitationFields.fromMap(mapPayload.fields);
    ChatTable chat =
        ChatListView.changeChatForParticipant(fields.chat, fields.users);

    await chatMessageListener.listenTo(fields.channel);
    await chatSendMessage.saveToChatList(
        userId: JwtPayload.myId, channel: channel, chat: chat);

    await ChatCreation(chatDatabaseCubit).createDynamically(chat, fields.users);
  }

  Future<void> inviteUser({
    required UserTable user,
    required ChatTable chat,
    required List<UserTable> users,
    required String chatChannel,
  }) async {
    await natsProvider.sendSystemMessageToChannel(
      natsProvider.getInvitations(user.id),
      MessageType.InviteUserToJoinChat,
      ChatInvitationFields(
        channel: chatChannel,
        chat: chat,
        users: users,
      ).toMap(),
    );
  }
}

class ChatInvitationFields {
  final String channel;
  final ChatTable chat;
  final List<UserTable> users;

  ChatInvitationFields({
    required this.channel,
    required this.chat,
    required this.users,
  });

  Map<String, String> toMap() {
    return {
      'channel': channel,
      'chat': chat.toJsonString(),
      'users': ChatUserViewModel.listUsersToString(users),
    };
  }

  factory ChatInvitationFields.fromMap(Map<String, dynamic> map) {
    return ChatInvitationFields(
      channel: map['channel'],
      chat: ChatTable.fromJson(jsonDecode(map['chat'])),
      users: ChatUserViewModel.getUsersFromString(map['users']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatInvitationFields.fromJson(String source) =>
      ChatInvitationFields.fromMap(json.decode(source));
}
