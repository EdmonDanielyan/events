import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';



void main() async {
  group("Playing with local nats server wss://localhost", () {
    setUpAll((){
      WidgetsFlutterBinding.ensureInitialized();
    });

    test('Connection', () async {
      print(File("./server-cert.pem").absolute.path);
      print('Connecting to localhost NATS server. Please ensure you have run it before');
      // NatsProvider natsProvider = NatsProvider(
      //     natsWssUrl: "wss://localhost",
      //     natsCluster: "test-cluster",
      //     certificate: File("./server-cert.pem").readAsBytesSync(),
      //     deviceVirtualId: 'kqjwelkjqwelkj',
      //     natsToken: "qlwejlqwleklkqwe",
      //     userId: '98019283098123');
      // await natsProvider.load();
      // var chatMessageListener = ChatMessageListener(
      //   natsProvider:
      // );
      // natsProvider.subscribeToChannel("ink.messaging.test", (p0, p1) => null)
    });
  });
}
