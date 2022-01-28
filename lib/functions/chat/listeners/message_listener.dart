import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/functions/chat/listeners/channels_registry.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

abstract class MessageListener with Loggable {
  final NatsProvider natsProvider;

  final ChannelsRegistry registry;

  bool isListeningToChannel(String channel) =>
      registry.isListening(channel);

  Future<void> onMessage(String channel, NatsMessage message) async {
    logger.finest(()=>"onMessage: $channel");
  }

  MessageListener(this.natsProvider, this.registry);
}
