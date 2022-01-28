import 'package:injectable/injectable.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/functions/chat/listeners/channels_registry.dart';
import 'package:ink_mobile/functions/chat/user_functions.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/nats/invitation.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

import '../chat_functions.dart';
import 'chat_saver.dart';

@injectable
class InviteSender {
  final NatsProvider natsProvider;
  final UserFunctions userFunctions;
  final ChatFunctions chatFunctions;
  final ChatDatabase db;
  final ChannelsRegistry registry;

  final ChatSaver chatSaver;

  const InviteSender(this.natsProvider, this.userFunctions, this.chatFunctions,
      this.chatSaver, this.db, this.registry);

  Future<void> removeFromPrivateUserChatIdList({
    required int userId,
    required String channel,
    required ChatTable chat,
    bool public = false,
  }) async {
    await natsProvider.sendSystemMessageToChannel(
      natsProvider.getPrivateUserChatIdList(userId.toString()),
      MessageType.ChatList,
      {
        chat.id: DELETE_ACTION,
        "channel": channel,
        "chat": chat.toJsonString(),
      },
    );
  }

  Future<void> inviteUser({
    required UserTable user,
    required ChatTable chat,
    required List<UserTable> users,
    required String chatChannel,
  }) async {
    await natsProvider.sendSystemMessageToChannel(
      natsProvider.getInviteUserToJoinChatChannel(user.id),
      MessageType.InviteUserToJoinChat,
      ChatInvitationFields(
        chat: chat,
        users: users,
      ).toMap(),
    );
  }

  Future<void> sendInvitations(ChatTable chat, List<UserTable> users) async {
    for (final user in users) {
      if (user.id != JwtPayload.myId) {
        await inviteUser(
          user: user,
          chat: chat,
          chatChannel: natsProvider.getChatChannelById(chat.id),
          users: users,
        );
      }
    }
  }
}
