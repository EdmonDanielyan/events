import 'dart:convert';

import 'package:ink_mobile/functions/chat/channel_functions.dart';
import 'package:ink_mobile/models/chat/chat_list_view.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';

import '../chat_user.dart';
import '../message_list_view.dart';

class ChatListFields {
  final List<ChatTable> chats;
  final List<UserTable> users;
  final List<ParticipantTable> participants;
  final List<MessageTable> messages;
  final List<ChannelTable> channels;

  const ChatListFields({
    required this.chats,
    required this.users,
    required this.participants,
    required this.messages,
    required this.channels,
  });

  Map<String, String> toMap() {
    return {
      'chats': ChatListView.listChatsToString(chats),
      'users': ChatUserViewModel.listUsersToString(users),
      'participants': ChatUserViewModel.listParticipantsToString(participants),
      'messages': MessageListView.listMessagesToString(messages),
      'channels': ChannelFunctions.listChannelsToString(channels),
    };
  }

  factory ChatListFields.fromMap(Map<String, dynamic> map) {
    return ChatListFields(
      chats: ChatListView.getChatsFromString(map['chats']),
      users: ChatUserViewModel.getUsersFromString(map['users']),
      participants:
          ChatUserViewModel.getParticipantsFromString(map['participants']),
      messages: MessageListView.getMessagesFromString(map['messages']),
      channels: ChannelFunctions.getChannelsFromString(map['channels']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatListFields.fromJson(String source) =>
      ChatListFields.fromMap(json.decode(source));
}
