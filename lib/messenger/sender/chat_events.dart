import 'package:injectable/injectable.dart';
import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/messenger/listeners/channels_registry.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/messenger/models/chat/nats/payloads/chat_info.dart';
import 'package:ink_mobile/messenger/models/chat/nats/payloads/chat_payload.dart';
import 'package:ink_mobile/messenger/models/chat/nats/payloads/left_joined.dart';
import 'package:ink_mobile/messenger/models/chat/nats/payloads/user_payload.dart';
import 'package:ink_mobile/messenger/providers/nats_provider.dart';

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
    bool send = await natsProvider.sendJsonMessageToChannel(
      chat.channel,
      MessageType.UpdateChatInfo,
      ChatInfoUpdatePayload(
        chat: ChatPayload(
            id: chat.id,
            name: chat.name,
            description: chat.description,
            ownerId: chat.ownerId,
            participantId: chat.participantId,
            avatar: chat.avatar,
            channel: chat.channel),
        userId: userFunctions.me.id.toString(),
      ).toJson(),
    );
    chatSaver.saveChats(newChat: null);
    return send;
  }

  Future<bool> sendUserChatJoinedMessage(ChatTable chat, List<UserTable> users,
      {required int initiatorId}) async {
    bool send = await natsProvider.sendJsonMessageToChannel(
      chat.channel,
      MessageType.UserJoined,
      LeftJoinedPayload(
        users: users
            .map<UserPayload>(
                (u) => UserPayload(id: u.id, name: u.name, avatar: u.avatar))
            .toList(),
        chatId: chat.id,
        initiatorId: initiatorId,
      ).toJson(),
    );
    chatSaver.saveChats(newChat: null);
    return send;
  }

  Future<void> sendLeftMessage(
    ChatTable chat, {
    required int initiatorId,
    List<UserTable>? users,
    bool unsubFromChat = true,
  }) async {
    var channel = chat.channel;
    await natsProvider.sendJsonMessageToChannel(
      channel,
      MessageType.UserLeftChat,
      LeftJoinedPayload(
        users: (users ?? [userFunctions.me])
            .map<UserPayload>(
                (e) => UserPayload(id: e.id, name: e.name, avatar: e.avatar))
            .toList(),
        chatId: chat.id,
        initiatorId: initiatorId,
      ).toJson(),
    );
    if (unsubFromChat) {
      await registry.unSubscribeOnChatDelete(channel);
    }

    await chatSaver.saveChats(newChat: null);
  }
}
