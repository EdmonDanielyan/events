import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:dart_nats_streaming/dart_nats_streaming.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ink_mobile/core/logging/file_log_appender.dart';
import 'package:ink_mobile/core/logging/logging.dart';
import 'package:ink_mobile/cubit/auth/auth_cubit.dart';
import 'package:ink_mobile/cubit/boot/boot_cubit.dart';
import 'package:ink_mobile/models/chat/nats_message.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/nats_provider.dart';
import 'package:ink_mobile/setup.config.dart';
import 'package:ink_mobile/setup.dart';
import 'package:logging/logging.dart';

import 'credentials/credentials.dart';
import 'credentials/credentials_provider.dart';
import 'mocks/mocks.dart';

void main() async {
  const certPath = "./assets/certs/cloud.jetrabbits.com.pem";
  late Uint8List certificate;
  final Logger groupLogger = Logger("Test Group");
  late Credentials credentials;


  setUpAll(() async {

  });

  group("Playing with local nats server wss://localhost", () {
    setUp(() async {
      await sl.reset();
      await $initGetIt(sl, environment: "dev");
      sl<BootCubit>().onStart = () async => true;
      setupLogging(sl<FileLogAppender>());
      groupLogger.info("Setup...");
      mockCertificateReader(sl, certPath);
      await mockLocalization(sl);
      var storage = mockSecureStorage(sl);
      storage.secureStorageData[DeviceTypes.virtualId.key] = "test2-" + Random().nextInt(10000000).toString();
      mockLockApp(sl);
      var credentialsProvider = CredentialsProvider()
        ..load("./test/messenger/test_data/test_users.yaml");
      credentials = credentialsProvider.users[0];

      FlutterError.onError = (FlutterErrorDetails details) {
        FlutterError.dumpErrorToConsole(details);
      };
    });

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
      await (natsProvider.load().timeout(Duration(seconds: 10)));
      expect(natsProvider.isConnected, true);
    });

    test('Test 3: Fetch all messages for specific channel', () async {
      final logger = Logger('Test 3');
      var channelId = "ink.messaging.group.Text.22812-05d828f7-46e6-4508-a163-44b9e4661793";


      logger.info("user: $credentials");
      var authCubit = sl<AuthCubit>();
      authCubit
        ..login = credentials.login
        ..password = credentials.password;

      logger.info("authenticating...");
      await expectLater(authCubit.auth(), completes);
      logger.info("auth is finished");
      await sl<TokenDataHolder>().update();

      var natsProvider = sl<NatsProvider>();
      natsProvider.onConnected = () async {
        natsProvider.subscribeToChannel(channelId, (channel, message) async {
          print(message.timestamp);
          print((message.payload as JsonPayload).json);
        },
            startPosition: StartPosition.SequenceStart);
      };
      natsProvider.onDisconnected = () async {
        natsProvider.unsubscribeFromChannel(channelId);
      };
      await natsProvider.load().timeout(Duration(seconds: 10));
      await Future.delayed(Duration(seconds: 10));
    });
  });
}
