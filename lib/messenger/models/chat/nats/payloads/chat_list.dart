import 'dart:convert';

import 'package:ink_mobile/messenger/cases/channel_functions.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat_list_view.dart';
import 'package:ink_mobile/messenger/models/chat_user.dart';


class ChatListPayload {
  final List<ChatTable> chats;
  final List<UserTable> users;
  final List<ParticipantTable> participants;
  final List<ChannelTable> channels;

  const ChatListPayload({
    required this.chats,
    required this.users,
    required this.participants,
    required this.channels,
  });

  Map<String, String> toMap() {
    return {
      'chats': ChatListView.listChatsToString(chats),
      'users': ChatUserViewModel.listUsersToString(users),
      'participants': ChatUserViewModel.listParticipantsToString(participants),
      'channels': ChannelFunctions.listChannelsToString(channels),
    };
  }

  factory ChatListPayload.fromMap(Map<String, dynamic> map) {
    return ChatListPayload(
      chats: ChatListView.getChatsFromString(map['chats'] ?? "[]"),
      users: ChatUserViewModel.getUsersFromString(map['users'] ?? "[]"),
      participants: ChatUserViewModel.getParticipantsFromString(
          map['participants'] ?? "[]"),
      channels: ChannelFunctions.getChannelsFromString(map['channels'] ?? "[]"),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatListPayload.fromJson(String source) =>
      ChatListPayload.fromMap(json.decode(source));
}
