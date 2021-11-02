import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

class ChatSendMessage {
  final NatsProvider natsProvider;

  const ChatSendMessage(this.natsProvider);

  Future<void> saveToPrivateUserChatIdList({
    required int userId,
    required String channel,
    required ChatTable chat,
    bool public = false,
  }) async {
    await natsProvider.sendSystemMessageToChannel(
      natsProvider.getPrivateUserChatIdList(userId.toString()),
      MessageType.ChatList,
      {
        chat.id: "",
        "channel": channel,
        "chat": chat.toJsonString(),
      },
    );
  }

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

  Future<void> sendTextMessage(String channel, String text) async {
    await natsProvider.sendTextMessageToChannel(channel, text);
  }
}
