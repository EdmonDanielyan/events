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
import 'package:ink_mobile/functions/chat/send_message.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/screens/messages/chat/entities/form_entities.dart';
import 'package:ink_mobile/setup.config.dart';
import 'package:ink_mobile/setup.dart';
import 'package:logging/logging.dart';

import 'credentials/credentials.dart';
import 'credentials/credentials_provider.dart';
import 'mocks/fakes.dart';
import 'mocks/mocks.dart';

void main() async {
  const certPath = "./assets/certs/cloud.jetrabbits.com.pem";

  setUpAll(() {
    registerFakes();
  });

  group("Messenger with defined user account from test_data", () {
    int maxParticipatesCount = 10;
    late FakeDatabaseData databaseData;
    late Credentials credentials;
    final Logger groupLogger = Logger("Test Group");

    tearDown(() async {
      groupLogger.info("tearDown...");
      await sl<Messenger>().dispose();
      groupLogger.info("Reset locator...");
      sl.reset();
    });

    setUp(() async {
      await $initGetIt(sl, environment: "test");
      setupLogging(sl<FileLogAppender>());
      groupLogger.info("Setup...");
      databaseData = FakeDatabaseData();
      mockChatDatabase(sl, databaseData);
      mockCertificateReader(sl, certPath);
      await mockLocalization(sl);
      mockSecureStorage(sl);
      mockLockApp(sl);
      sl<Messenger>().silentMode = true;
      var credentialsProvider = CredentialsProvider()..load("./test/messenger/test_data/test_users.yaml");
      credentials = credentialsProvider.users[0];

      FlutterError.onError = (FlutterErrorDetails details) {
        FlutterError.dumpErrorToConsole(details);
        ErrorsToServer(
          error: details.exception.toString(),
          stack: details.stack.toString(),
        ).send();
      };
    });


    test('Test 1: Login with given user and create chat with random participates', () async {
      final logger = Logger('Test 1');
      logger.info("Start");
      (sl<SecureStorage>() as MockSecureStorage).secureStorageData[DeviceTypes.virtualId.key] = "test1-" + Random().nextInt(10000000).toString();
      Future? initMessageProviderFuture;
      sl<BootCubit>()
        ..onStart = () async {
          initMessageProviderFuture = sl<Messenger>().init();
          return await initMessageProviderFuture;
        };

      logger.info("user: $credentials");
      var authCubit = sl<AuthCubit>();
      authCubit
        ..login = credentials.login
        ..password = credentials.password;

      logger.info("authenticating...");
      await expectLater(authCubit.auth(), completes);
      logger.info("auth is finished");
      logger.info("Messenger initializing...");
      expect(initMessageProviderFuture, isNotNull);
      await expectLater(initMessageProviderFuture!, completes);
      logger.info("Messenger initializing is finished");

      logger.info("Loading users...");
      var chatPersonListCubit = sl<ChatPersonListCubit>();
      await expectLater(chatPersonListCubit.loadUsers(), completes);
      logger.info("Loading users is finished");

      logger.info("Choosing chat participates...");
      var messageProvider = sl<Messenger>();
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
      logger.info("Chat participates: $participates");

      await Future.delayed(Duration(seconds: 1));

      expect(sl<Messenger>().isConnected, isTrue);

      logger.info("Creating chat...");
      DateTime dateTime = DateTime.now();
      var createChatFuture = messageProvider.chatCreation.createGroupThroughNats(
          name:
              "SVT: ${dateTime.millisecondsSinceEpoch} тестовый чат создал $myName",
          users: participates);
      await expectLater(createChatFuture, completes);
      logger.info("Chat is created");
      logger.info("Test database:\n $databaseData");
      expect(databaseData.users, isNotEmpty, reason: "Users should be none-empty");
      expect(databaseData.channels, isNotEmpty, reason: "Channels should be none-empty");
      expect(databaseData.chats, isNotEmpty, reason: "Chats should be none-empty");
      expect(databaseData.participates, isNotEmpty, reason: "Participates should be none-empty");
    });
    
    test('Test 2: Get all chats then send random message to them', () async {
      final logger = Logger('Test 2');
      (sl<SecureStorage>() as MockSecureStorage).secureStorageData[DeviceTypes.virtualId.key] = "test2-" + Random().nextInt(10000000).toString();

      Future? initMessageProviderFuture;
      sl<BootCubit>()
        ..onStart = () async {
          initMessageProviderFuture = sl<Messenger>().init();
          return true;
        };
      logger.info("user: $credentials");
      var authCubit = sl<AuthCubit>();
      authCubit
        ..login = credentials.login
        ..password = credentials.password;

      logger.info("authenticating...");
      await expectLater(authCubit.auth(), completes);
      logger.info("auth is finished");
      logger.info("Messenger initializing...");
      expect(initMessageProviderFuture, isNotNull);
      await expectLater(initMessageProviderFuture!, completes);
      logger.info("Messenger initializing is finished");

      logger.info("waiting 10 sec to load data from NATS ...");
      await Future.delayed(Duration(seconds: 10));
      expect(sl<Messenger>().isConnected, isTrue);

      logger.info("Test database before sending message:\n $databaseData");
      expect(databaseData.users, isNotEmpty, reason: "Users should be none-empty");
      expect(databaseData.channels, isNotEmpty, reason: "Channels should be none-empty");
      expect(databaseData.chats, isNotEmpty, reason: "Chats should be none-empty");
      expect(databaseData.participates, isNotEmpty, reason: "Participates should be none-empty");
      
      logger.info("picking some chat..");
      var chat = databaseData.chats.values.first;
      logger.info("sending messages to chat: ${chat.id}...");

      final sendMessage = sl<SendMessage>();
      final message = await sendMessage.call(chat, ChatEntities(text: "Use the Force, Luke"));
      await sl<Messenger>().textSender.sendMessage(chat, message);
      logger.info("Test database after sending message:\n $databaseData");
      expect(databaseData.users, isNotEmpty, reason: "Users should be none-empty");
      expect(databaseData.channels, isNotEmpty, reason: "Channels should be none-empty");
      expect(databaseData.chats, isNotEmpty, reason: "Chats should be none-empty");
      expect(databaseData.participates, isNotEmpty, reason: "Participates should be none-empty");
      expect(databaseData.messages, isNotEmpty, reason: "messages should be none-empty");
    });


  });
}
