import 'package:injectable/injectable.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats/chat_list.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

@injectable
class ChatSaver {
  final ChatDatabase db;

  final NatsProvider natsProvider;

  ChatSaver(this.db, this.natsProvider);

  Future<void> saveChats({
    required ChatTable? newChat,
    List<ChatTable>? chats,
    int? userId,
    bool sendToServer: true
  }) async {
    chats = chats ?? await db.getAllChats();
    final users = await db.getAllUsers();
    final participants = await db.getAllParticipants();
    final messages = await db.getAllMessages();
    final channels = await db.getAllChannels();

    if (newChat != null) {
      for (int i = 0; i < chats.length; i++) {
        if (chats[i].id == newChat.id) {
          chats.removeAt(i);
        }
      }

      chats.add(newChat);
    }

    if (sendToServer) {
      await saveToPrivateUserChatIdList(
        userId: userId ?? JwtPayload.myId,
        users: users,
        chats: chats,
        participants: participants,
        messages: messages,
        channels: channels,
      );
    }
  }

  Future<void> saveToPrivateUserChatIdList({
    required int userId,
    required List<ChatTable> chats,
    required List<UserTable> users,
    required List<ParticipantTable> participants,
    required List<MessageTable> messages,
    required List<ChannelTable> channels,
  }) async {
    final chatListFields = ChatListFields(
      chats: chats.toSet().toList(),
      users: users.toSet().toList(),
      participants: participants.toSet().toList(),
      messages: messages.toSet().toList(),
      channels: channels.toSet().toList(),
    );

    await natsProvider.sendSystemMessageToChannel(
      natsProvider.getPrivateUserChatIdList(userId.toString()),
      MessageType.ChatList,
      chatListFields.toMap(),
    );
  }
}