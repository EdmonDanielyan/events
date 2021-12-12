import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ink_mobile/constants/messenger.dart';
import 'package:ink_mobile/core/errors/errors_to_server.dart';
import 'package:ink_mobile/core/logging/file_log_appender.dart';
import 'package:ink_mobile/core/logging/logging.dart';
import 'package:ink_mobile/cubit/auth/auth_cubit.dart';
import 'package:ink_mobile/cubit/boot/boot_cubit.dart';
import 'package:ink_mobile/cubit/chat_person_list/chat_person_list_cubit.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/chat/database/model/message_with_user.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/lock_app.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/setup.config.dart';
import 'package:ink_mobile/setup.dart';
// import 'mock_chat_database.dart';
// import 'svt.mocks.dart';
import 'package:mocktail/mocktail.dart';

class TestSecureStorage extends SecureStorage {
  Map<String, String> secureStorageData = {};

  Future<String?> read(String key) async {
    return Future.value(secureStorageData[key]);
  }

  Future<void> deleteAll() {
    secureStorageData.clear();
    return Future.value();
  }

  Future<void> write({required String key, required String value}) {
    secureStorageData[key] = value;
    return Future.value();
  }

  Future<bool> containsKey(String key) {
    return Future.value(secureStorageData.containsKey(key));
  }
}

class MockChatDatabase extends Mock implements ChatDatabase {}
class MockCertificateReader extends Mock implements CertificateReader {}
class MockLockApp extends Mock implements LockApp {}
class FakeParticipantTable extends Fake implements ParticipantTable {}
class FakeUserTable extends Fake implements UserTable {}
class FakeChannelTable extends Fake implements ChannelTable {}
class FakeMessageTable extends Fake implements MessageTable {}
class FakeChatTable extends Fake implements ChatTable {}

class FakeDatabaseData {
  final Map<int, UserTable> users = {};
  final Map<String, ChatTable> chats = {};
  final List<ParticipantTable> participates = [];
  final List<ChannelTable> channels = [];
  final List<MessageTable> dbMessages = [];

  @override
  String toString() {
    return '''
    Users: $users
    Participates: $participates
    Chats: $chats
    Channels: $channels
    Messages: $dbMessages
    ''';
  }
}

// @GenerateMocks([CertificateReader, LockApp])
void main() async {
  const certPath = "./assets/certs/cloud.jetrabbits.com.pem";
  setUpAll(() {
    registerFallbackValue(FakeUserTable());
    registerFallbackValue(FakeParticipantTable());
    registerFallbackValue(FakeChannelTable());
    registerFallbackValue(FakeMessageTable());
    registerFallbackValue(FakeChatTable());
  });

  group("Messenger with account from test_data", () {
    int maxParticipatesCount = 10;
    late MockChatDatabase chatDataBase;
    late MockCertificateReader certificateReader;
    late MockLockApp lockApp;
    late FakeDatabaseData databaseData;

    void mockChatDatabase(MockChatDatabase db, FakeDatabaseData databaseData){
      when(() => chatDataBase.selectChatById(any())).thenAnswer((realInvocation) async {
        var chatId = realInvocation.positionalArguments[0] as String;
        return databaseData.chats[chatId];
      });

      when(() => chatDataBase.insertParticipant(any())).thenAnswer((realInvocation) async {
        databaseData.participates.add(realInvocation.positionalArguments[0] as ParticipantTable);
        return 1;
      });

      when(() => chatDataBase.selectParticipantById(any(), any())).thenAnswer((realInvocation) async {
        var userId = realInvocation.positionalArguments[0] as int?;
        var chatId = realInvocation.positionalArguments[1] as String?;
        var result = databaseData.participates.where((element) => element.chatId == chatId && element.userId == userId).toList();
        return result.isNotEmpty ? result.first : null;
      });

      when(() => chatDataBase.selectUserById(any())).thenAnswer((realInvocation) => Future.value(null));

      when(() => chatDataBase.insertChat(any())).thenAnswer((realInvocation) async {
        var chat = realInvocation.positionalArguments[0] as ChatTable;
        databaseData.chats[chat.id] = chat;
        return 1;
      });

      when(() => chatDataBase.insertUser(any())).thenAnswer((realInvocation) async {
        var userTable = realInvocation.positionalArguments[0] as UserTable;
        databaseData.users[userTable.id] = userTable;
        return 1;
      });

      when(() => chatDataBase.insertChannel(any())).thenAnswer((realInvocation) async {
        var channel = realInvocation.positionalArguments[0] as ChannelTable;
        databaseData.channels.add(channel);
        return 1;
      });

      when(() => chatDataBase.getAllChannels()).thenAnswer((realInvocation) async => databaseData.channels);
      when(() => chatDataBase.getAllChats()).thenAnswer((realInvocation) async => databaseData.chats.values.toList());
      when(() => chatDataBase.getAllUsers()).thenAnswer((realInvocation) async => databaseData.users.values.toList());
      when(() => chatDataBase.getAllParticipants()).thenAnswer((realInvocation) async => databaseData.participates);
      when(() => chatDataBase.getAllMessages()).thenAnswer((realInvocation) async => databaseData.dbMessages);

      when(() => chatDataBase.getChatMessages(any())).thenAnswer((realInvocation) async {
        var chatId = realInvocation.positionalArguments[0] as String;
        return databaseData.dbMessages.where((element) => element.chatId == chatId).map((message) {
          var user = databaseData.users[message.userId] ?? FakeUserTable();
          return MessageWithUser(message: message, user: user);
        }).toList();
      });

      //No unsent messages
      when(() => chatDataBase.getUnsentMessages(any())).thenAnswer((_) async => []);

      when(() => chatDataBase.insertMessage(any())).thenAnswer((realInvocation) async {
        databaseData.dbMessages.add(realInvocation.positionalArguments[0] as MessageTable);
        return 1;
      });

      when(() => chatDataBase.getChannelByChannelName(any())).thenAnswer((realInvocation) async {
        var result = databaseData.channels.where((element) {
          return element.id == realInvocation.positionalArguments[0];
        }).toList();
        return result.isNotEmpty ? result.first : null;
      });
    }

    void mockCertificateReader(MockCertificateReader certificateReader){
      var certificate = File(certPath).readAsBytesSync();
      when(() => certificateReader.data).thenReturn(certificate);
    }

    void mockLockApp(MockLockApp lockApp){
      when(() => lockApp.canCheckBiometrics())
          .thenAnswer((realInvocation) => Future.value(true));

      when(() => lockApp.authentificate())
          .thenAnswer((realInvocation) => Future.value(true));
    }

    setUp(() async {
      chatDataBase = MockChatDatabase();
      databaseData = FakeDatabaseData();
      mockChatDatabase(chatDataBase, databaseData);
      certificateReader = MockCertificateReader();
      mockCertificateReader(certificateReader);
      lockApp = MockLockApp();
      mockLockApp(lockApp);
      AppLocalizations appLocalizations =
          await AppLocalizations.delegate.load(Locale('ru'));


      $initGetIt(sl, environment: "test");
      sl
        ..unregister<ChatDatabase>()
        ..unregister<SecureStorage>()
        ..unregister<CertificateReader>()
        ..unregister<LockApp>()
        ..registerSingleton<ChatDatabase>(chatDataBase)
        ..registerSingleton<AppLocalizations>(appLocalizations)
        ..registerLazySingleton<LockApp>(() => lockApp)
        ..registerLazySingleton<CertificateReader>(() => certificateReader)
        ..registerLazySingleton<SecureStorage>(() => TestSecureStorage());
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
          initMessageProviderFuture =
              UseMessageProvider.initMessageProvider();
          return await initMessageProviderFuture;
        };

      var authCubit = sl<AuthCubit>();
      authCubit
        ..login = 'morozov.m'
        ..password = '123456';
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
      List<UserTable> participates = chatPersonListCubit.items.getRange(start, end).toList();
      print("Chat participates: $participates");

      print("Creating chat...");
      DateTime dateTime = DateTime.now();
      var createChatFuture = messageProvider.chatCreation.createGroupThroughNats(name: "SVT: ${dateTime.millisecondsSinceEpoch} тестовый чат создал $myName" , users: participates);
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
