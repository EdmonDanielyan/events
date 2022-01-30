import 'dart:convert';

import 'package:ink_mobile/messenger/cases/channel_functions.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat_list_view.dart';
import 'package:ink_mobile/messenger/models/chat_user.dart';


class ChatListFields {
  final List<ChatTable> chats;
  final List<UserTable> users;
  final List<ParticipantTable> participants;
  final List<ChannelTable> channels;

  const ChatListFields({
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

  factory ChatListFields.fromMap(Map<String, dynamic> map) {
    return ChatListFields(
      chats: ChatListView.getChatsFromString(map['chats'] ?? "[]"),
      users: ChatUserViewModel.getUsersFromString(map['users'] ?? "[]"),
      participants: ChatUserViewModel.getParticipantsFromString(
          map['participants'] ?? "[]"),
      channels: ChannelFunctions.getChannelsFromString(map['channels'] ?? "[]"),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatListFields.fromJson(String source) =>
      ChatListFields.fromMap(json.decode(source));
}
