import 'package:flutter_test/flutter_test.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

void main() async {
  setUp(() {});

  group("Playing with local nats server wss://localhost", () {
    test('User 1', () async {
      NatsProvider natsProvider = NatsProvider(
          natsWssUrl: "wss://localhost",
          natsCluster: "test-cluster",
          natsCertPath: "./server-cert.pem",
          deviceVirtualId: '',
          natsToken: "",
          userId: '');
      await natsProvider.load();
      // var chatMessageListener = ChatMessageListener(
      //   natsProvider:
      // );
      // natsProvider.subscribeToChannel("ink.messaging.test", (p0, p1) => null)
    });
    test('User 2', () async {
      NatsProvider natsProvider = NatsProvider(
          natsWssUrl: "wss://localhost",
          natsCluster: "test-cluster",
          natsCertPath: "./server-cert.pem",
          deviceVirtualId: '',
          natsToken: "",
          userId: '');
      await natsProvider.load();
      // var chatMessageListener = ChatMessageListener(
      //   natsProvider:
      // );
      // natsProvider.subscribeToChannel("ink.messaging.test", (p0, p1) => null)
    });
  });
}
