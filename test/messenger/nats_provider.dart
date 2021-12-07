import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:ink_mobile/providers/nats_provider.dart';

void main() async {
  const certPath = "./test/docker-services/nats/certs/server-cert.pem";
  late Uint8List certificate;

  setUpAll(() async {

  });

  group("Playing with local nats server wss://localhost", () {


    test('Loading test. Please run nats in docker-services directory before', () async {
      print("!!!!!!");
      print(File(certPath).absolute.path);
      certificate = File(certPath).readAsBytesSync();
      NatsProvider natsProvider = NatsProvider(
          natsWssUrl: "wss://localhost",
          natsCluster: "test-cluster",
          certificate: certificate,
          deviceVirtualId: '',
          natsToken: "",
          userId: '');
      await natsProvider.load();
    });
  });
}
