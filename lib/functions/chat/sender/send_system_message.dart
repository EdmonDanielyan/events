import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

class ChatSendMessage {
  final NatsProvider natsProvider;

  const ChatSendMessage(this.natsProvider);

  Future<void> saveToChatList({
    required int userId,
    required String channel,
    required ChatTable chat,
    bool public = false,
  }) async {
    await natsProvider.sendSystemMessageToChannel(
      natsProvider.getPrivateUserChatList(userId.toString()),
      MessageType.ChatList,
      {
        channel: ADD_ACTION,
        "channel": channel,
        "chat": chat.toJsonString(),
      },
    );
  }

  Future<void> sendTextMessage(String channel, String text) async {
    await natsProvider.sendTextMessageToChannel(channel, text);
  }
}
