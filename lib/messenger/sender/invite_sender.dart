import 'package:injectable/injectable.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/messenger/cases/user_functions.dart';
import 'package:ink_mobile/messenger/listeners/channels_registry.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/nats/payloads/chat_payload.dart';
import 'package:ink_mobile/messenger/models/chat/nats/payloads/invite_payload.dart';
import 'package:ink_mobile/messenger/models/chat/nats/payloads/user_payload.dart';
import 'package:ink_mobile/messenger/providers/nats_provider.dart';
import 'package:ink_mobile/models/jwt_payload.dart';

import '../cases/chat_functions.dart';
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
      natsProvider.getPrivateUserChatIdList(),
      MessageType.ChatList,
      {
        chat.id: DELETE_ACTION,
        "channel": channel,
        "chat": chat.toJsonString(),
      },
    );
  }

  Future<void> sendInvitations(ChatTable chat, List<UserTable> users) async {
    for (final user in users) {
      if (user.id != JwtPayload.myId) {
        await natsProvider.invite(
            users.map<InvitePayload>((u) => InvitePayload(
                whoInvites: UserPayload.fromUserTable(userFunctions.me),
                invitedUserId: user.id.toString(),
                chat: ChatPayload.fromChatTable(chat))).toList()
            );
      }
    }
  }
}
