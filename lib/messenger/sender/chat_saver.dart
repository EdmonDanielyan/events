import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/nats/payloads/chat_list.dart';
import 'package:ink_mobile/messenger/providers/nats_provider.dart';
import 'package:ink_mobile/models/debouncer.dart';
import 'package:ink_mobile/models/jwt_payload.dart';

@injectable
class ChatSaver with Loggable {
  final ChatDatabase db;

  final NatsProvider natsProvider;

  ChatSaver(this.db, this.natsProvider);

  Debouncer _chatListDebouncer = Debouncer(milliseconds: 300);

  String get getInviteUserChannel =>
      natsProvider.getInviteUserToJoinChatChannel();

  Future<void> saveChats(
      {required ChatTable? newChat,
      List<ChatTable>? chats,
      int? userId,
      bool sendToServer: true}) async {
    chats = chats ?? await db.getAllChats();
    final users = await db.getAllUsers();
    final participants = await db.getAllParticipants();
    List<ChannelTable> channels = [];

    final inviteUserChannel = await db.getChannelById(getInviteUserChannel);
    if (inviteUserChannel != null) {
      channels.add(inviteUserChannel);
    }

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
        channels: channels,
      );
    }
  }

  Future<void> saveToPrivateUserChatIdList({
    required int userId,
    required List<ChatTable> chats,
    required List<UserTable> users,
    required List<ParticipantTable> participants,
    required List<ChannelTable> channels,
  }) async {
    await _chatListDebouncer.run(() async {
      final chatListFields = ChatListPayload(
        chats: chats.toSet().toList(),
        users: users.toSet().toList(),
        participants: participants.toSet().toList(),
        channels: channels.toSet().toList(),
      );

      logger.finest(() => '''
      SAVING CHATS FOR ${JwtPayload.myId}:
      users: ${users.length}
      chats: ${chats.length}
      participants: ${participants.length}
      channels: ${channels.length}
      ''');

      await natsProvider.sendSystemMessageToChannel(
        natsProvider.getPrivateUserChatIdList(),
        MessageType.ChatList,
        chatListFields.toMap(),
      );
    });
  }
}
