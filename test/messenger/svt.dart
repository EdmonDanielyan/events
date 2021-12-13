import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ink_mobile/core/errors/errors_to_server.dart';
import 'package:ink_mobile/core/logging/file_log_appender.dart';
import 'package:ink_mobile/core/logging/logging.dart';
import 'package:ink_mobile/cubit/auth/auth_cubit.dart';
import 'package:ink_mobile/cubit/boot/boot_cubit.dart';
import 'package:ink_mobile/cubit/chat_person_list/chat_person_list_cubit.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/setup.config.dart';
import 'package:ink_mobile/setup.dart';

import 'credentials/credentials.dart';
import 'credentials/credentials_provider.dart';
import 'credentials/random_credentials.dart';
import 'mocks/fakes.dart';
import 'mocks/mocks.dart';

void main() async {
  const certPath = "./assets/certs/cloud.jetrabbits.com.pem";

  setUpAll(() {
    registerFakes();
  });

  group("Messenger with account from test_data", () {
    int maxParticipatesCount = 10;
    late FakeDatabaseData databaseData;
    late Credentials credentials;

    setUp(() async {
      $initGetIt(sl, environment: "test");

      databaseData = FakeDatabaseData();
      mockChatDatabase(sl, databaseData);
      mockCertificateReader(sl, certPath);
      await mockLocalization(sl);
      mockSecureStorage(sl);
      mockLockApp(sl);
      var credentialsProvider = CredentialsProvider()..load("./test/messenger/test_data/users.yaml");
      credentials = RandomCredentials(credentialsProvider.users);

      setupLogging(sl<FileLogAppender>());
      FlutterError.onError = (FlutterErrorDetails details) {
        FlutterError.dumpErrorToConsole(details);
        ErrorsToServer(
          error: details.exception.toString(),
          stack: details.stack.toString(),
        ).send();
      };
    });

    test('Creation chat with random participates', () async {
      Future? initMessageProviderFuture;
      sl<BootCubit>()
        ..onStart = () async {
          initMessageProviderFuture = UseMessageProvider.initMessageProvider();
          return await initMessageProviderFuture;
        };
      print("user: $credentials");
      var authCubit = sl<AuthCubit>();
      authCubit
        ..login = credentials.login
        ..password = credentials.password;

      print("authenticating...");
      await expectLater(authCubit.auth(), completes);
      print("auth is finished");
      print("Messenger initializing...");
      expect(initMessageProviderFuture, isNotNull);
      await expectLater(initMessageProviderFuture!, completes);
      print("Messenger initializing is finished");

      print("Loading users...");
      var chatPersonListCubit = sl<ChatPersonListCubit>();
      await expectLater(chatPersonListCubit.loadUsers(), completes);
      print("Loading users is finished");

      print("Choosing chat participates...");
      var messageProvider = sl<MessageProvider>();
      var myName = messageProvider.userFunctions.me.name;
      var length = chatPersonListCubit.items.length;
      var start = Random().nextInt(length);
      var end = start + maxParticipatesCount;
      if (end > length) {
        end = length - 1;
        start = end - maxParticipatesCount;
      }
      if (start < 0) start = 0;
      if (end > length) end = length - 1;
      List<UserTable> participates =
          chatPersonListCubit.items.getRange(start, end).toList();
      print("Chat participates: $participates");

      print("Creating chat...");
      DateTime dateTime = DateTime.now();
      var createChatFuture = messageProvider.chatCreation.createGroupThroughNats(
          name:
              "SVT: ${dateTime.millisecondsSinceEpoch} тестовый чат создал $myName",
          users: participates);
      await expectLater(createChatFuture, completes);
      print("Chat is created");
      print("Test database:\n $databaseData");
      expect(databaseData.channels, isNotEmpty);
      expect(databaseData.chats, isNotEmpty);
      expect(databaseData.users, isNotEmpty);
      expect(databaseData.participates, isNotEmpty);
    });
  });
}
