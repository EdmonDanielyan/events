import 'package:injectable/injectable.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/messenger/listeners/channels_registry.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/nats/chat_info.dart';
import 'package:ink_mobile/messenger/models/chat/nats/invitation.dart';
import 'package:ink_mobile/messenger/models/chat/nats/leftJoined.dart';
import 'package:ink_mobile/messenger/providers/nats_provider.dart';
import 'package:ink_mobile/models/token.dart';

import '../cases/user_functions.dart';
import 'chat_saver.dart';

@injectable
class ChatEventsSender {
  final NatsProvider natsProvider;
  final UserFunctions userFunctions;
  final ChatSaver chatSaver;

  final ChannelsRegistry registry;

  ChatEventsSender(
      this.natsProvider, this.userFunctions, this.chatSaver, this.registry);

  Future<bool> sendNewChatInfo(ChatTable chat, {UserTable? user}) async {
    var channel = natsProvider.getChatChannelById(chat.id);
    bool send = await natsProvider.sendSystemMessageToChannel(
      channel,
      MessageType.UpdateChatInfo,
      ChatInfoFields(
        channel: channel,
        chat: chat,
        user: userFunctions.me,
      ).toMap(),
    );
    chatSaver.saveChats(newChat: null);
    return send;
  }

  Future<bool> sendUserChatJoinedMessage(
      ChatTable chat, List<UserTable> users) async {
    bool send = await natsProvider.sendSystemMessageToChannel(
      natsProvider.getChatChannelById(chat.id),
      MessageType.UserJoined,
      ChatInvitationFields(
        users: users,
        chat: chat,
      ).toMap(),
    );
    chatSaver.saveChats(newChat: null);
    return send;
  }

  Future<void> sendLeftMessage(
    ChatTable chat, {
    List<UserTable>? users,
    bool unsubFromChat = true,
    int? senderId,
    int? countLefts,
  }) async {
    await natsProvider.sendSystemMessageToChannel(
      natsProvider.getChatChannelById(chat.id),
      MessageType.UserLeftChat,
      ChatLeftJoinedFields(
        users: users ?? [userFunctions.me],
        chat: chat,
        senderId: senderId ?? JwtPayload.myId,
        countLefts: countLefts,
      ).toMap(),
    );

    if (unsubFromChat) {
      await registry.unSubscribeOnChatDelete(chat.id);
    }

    await chatSaver.saveChats(newChat: null);
  }
}
