import 'dart:io';
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
import 'package:ink_mobile/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/lock_app.dart';
import 'package:ink_mobile/providers/message_provider.dart';
import 'package:ink_mobile/setup.config.dart';
import 'package:ink_mobile/setup.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'mock_chat_database.dart';
import 'svt.mocks.dart';

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

@GenerateMocks([CertificateReader, LockApp])
void main() async {
  const certPath = "./assets/certs/cloud.jetrabbits.com.pem";

  Map<int, UserTable> dbUserTable = {};
  setUpAll(() async {});

  group("Messenger with account from test_data", () {
    test('Connect to real dev server', () async {
      MockChatDatabase chatDataBase = MockChatDatabase();
      var certificate = File(certPath).readAsBytesSync();
      AppLocalizations appLocalizations =
          await AppLocalizations.delegate.load(Locale('ru'));
      CertificateReader certificateReader = MockCertificateReader();
      MockLockApp lockApp = MockLockApp();
      when(chatDataBase.selectUserById(any)).thenAnswer((realInvocation) => Future.value(null));
      when(chatDataBase.insertUser(any)).thenAnswer((realInvocation) async {
        var userTable = realInvocation.positionalArguments[0] as UserTable;
        dbUserTable[userTable.id] = userTable;
        return 1;
      });
      when(certificateReader.data).thenReturn(certificate);
      when(lockApp.canCheckBiometrics())
          .thenAnswer((realInvocation) => Future.value(true));
      when(lockApp.authentificate())
          .thenAnswer((realInvocation) => Future.value(true));
      $initGetIt(sl, environment: "test");
      sl.unregister<ChatDatabase>();
      sl.unregister<SecureStorage>();
      sl.unregister<CertificateReader>();
      sl.unregister<LockApp>();
      sl.registerSingleton<ChatDatabase>(chatDataBase);
      sl.registerSingleton<AppLocalizations>(appLocalizations);
      sl.registerLazySingleton<LockApp>(() => lockApp);
      sl.registerLazySingleton<CertificateReader>(() => certificateReader);
      sl.registerLazySingleton<SecureStorage>(() => TestSecureStorage());
      setupLogging(sl<FileLogAppender>());
      FlutterError.onError = (FlutterErrorDetails details) {
        FlutterError.dumpErrorToConsole(details);
        ErrorsToServer(
          error: details.exception.toString(),
          stack: details.stack.toString(),
        ).send();
      };

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
    });
  });
}
