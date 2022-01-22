import 'package:fixnum/fixnum.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/chat/listeners/channels_registry.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

abstract class ChannelListener with Loggable {
  final NatsProvider natsProvider;

  final ChannelsRegistry registry;

  bool isListeningToChannel(String channel) =>
      registry.isListening(channel);

  Future<void> onMessage(String channel, NatsMessage message) async {
    logger.finest(()=>"onMessage: $channel");
  }

  Future<void> onListen(String channel,
      {Int64 startSequence = Int64.ZERO}) async {
    try {
      if (!registry.isListening(channel)) {
        await natsProvider.subscribeToChannel(channel, onMessage,
            maxInFlight: 1024,
            startSequence: startSequence);
      }
    } on SubscriptionAlreadyExistException {}
  }

  ChannelListener(this.natsProvider, this.registry);
}
