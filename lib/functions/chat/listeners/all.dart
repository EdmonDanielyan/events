import 'package:ink_mobile/extensions/nats_extension.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

class NatsListener {
  final NatsProvider natsProvider;
  const NatsListener({required this.natsProvider});

  Future<void> listenToAll() async {
    natsProvider.onMessage = (String channel, NatsMessage message) async {
      hidePingPong(message, () {
        print("LISTENING TO ALL");
        print(channel);
        print(message);
      });
    };
  }

  void hidePingPong(NatsMessage message, Function() callback) {
    bool notMe = message.from != JwtPayload.myId.toString();
    bool payloadIsNotMessage = message.type != PayloadType.message;
    if (notMe && payloadIsNotMessage) {
      callback();
    }
  }
}
