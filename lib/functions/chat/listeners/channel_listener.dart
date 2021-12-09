import 'package:fixnum/fixnum.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/chat/listeners/channels_registry.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

abstract class ChannelListener {
  final NatsProvider natsProvider;

  final ChannelsRegistry registry;

  Future<void> onMessage(String channel, NatsMessage message);

  Future<void> onListen(String channel,
      {Int64 startSequence = Int64.ZERO}) async {
    try {
      if (!registry.isListening(channel)) {
        await natsProvider.subscribeToChannel(channel, onMessage,
            startSequence: startSequence);
      }
    } on SubscriptionAlreadyExistException {}
  }

  const ChannelListener(this.natsProvider, this.registry);
}
