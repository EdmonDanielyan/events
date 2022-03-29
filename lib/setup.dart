import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/file_log_appender.dart';
import 'package:ink_mobile/core/logging/logging.dart';
import 'package:ink_mobile/cubit/boot/boot_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/providers/notifications/notifications.dart';
import 'package:ink_mobile/providers/package_info.dart';
import 'package:ink_mobile/providers/secure_storage.dart';
import 'package:logging/logging.dart';

import 'messenger/providers/messenger.dart';
import 'messenger/providers/notifications/push_notification_manager.dart';
import 'setup.config.dart';

final sl = GetIt.instance;

const unitTest = Environment("unitTest");
//todo: Раскомментировать на релизе
// const defaultScope = Environment.prod;
const defaultScope = Environment.prod;

late String currentEnv;

Future<String> readEnv() async {
  currentEnv = await SecureStorage().read("environment") ?? defaultScope;
  return currentEnv;
}

void writeEnv(String value) async {
  SecureStorage().write(key: "environment", value: value);
  currentEnv = value;
}

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> setup({
  scope = defaultScope,
}) async {
  await sl.reset();
  await $initGetIt(sl, environment: scope);
  setupI18n(sl);

  setupLogging(sl<FileLogAppender>(),
      //todo: Убрать подробное логирование перед публикаций в сторы
      forceLevel: Level.ALL);

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  };

  sl<BootCubit>()
    ..onStart = () async {
      await sl<LocalNotificationsProvider>().load();
      await sl<PushNotificationManager>().load();

      await sl<Messenger>().init();

      return true;
    };
  await sl<PackageInfoProvider>().load();
}

Future<void> fcmSetup({
  scope = defaultScope,
}) async {
  await sl.reset();
  WidgetsFlutterBinding.ensureInitialized();
  await $initGetIt(sl, environment: scope);

  setupLogging(sl<FileLogAppender>(),
      //todo: Убрать подробное логирование перед публикаций в сторы
      forceLevel: Level.ALL);

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  };
  await sl<PackageInfoProvider>().load();
}
