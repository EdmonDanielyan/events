import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

class ChatMessageListener {
  final NatsProvider natsProvider;

  const ChatMessageListener(this.natsProvider);

  Future<void> onMessage(String channel, NatsMessage message) async {
    print("Message");
    print(channel);
    print(message);
  }

  Future<void> listenTo(String channel) async {
    await natsProvider.subscribeToChannel(channel, onMessage);
  }
}
