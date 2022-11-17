import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/file_log_appender.dart';
import 'package:ink_mobile/core/logging/logging.dart';
import 'package:ink_mobile/cubit/boot/boot_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/providers/notifications.dart';
import 'package:ink_mobile/providers/package_info.dart';
import 'package:ink_mobile/providers/secure_storage.dart';
import 'package:logging/logging.dart';

import 'setup.config.dart';

final getIt = GetIt.instance;

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
  await $initGetIt(getIt, environment: scope);
  setupI18n(getIt);

  setupLogging(
    getIt<FileLogAppender>(),
    //todo: Убрать подробное логирование перед публикаций в сторы
    forceLevel: Level.ALL,
  );

  await getIt<LocalNotificationsProvider>().load();

  getIt<BootCubit>()
    ..onStart = () async {
      return true;
    };
  await getIt<PackageInfoProvider>().load();
}

Future<void> fcmSetup({
  scope = defaultScope,
}) async {
  await getIt.reset();
  WidgetsFlutterBinding.ensureInitialized();
  await $initGetIt(getIt, environment: scope);

  setupLogging(
    getIt<FileLogAppender>(),
    forceLevel: Level.WARNING,
  );

  await getIt<PackageInfoProvider>().load();
}
