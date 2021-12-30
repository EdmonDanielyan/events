import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/file_log_appender.dart';
import 'package:ink_mobile/core/logging/logging.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/providers/notifications.dart';
import 'package:ink_mobile/providers/package_info.dart';
import 'package:location/location.dart';
import 'package:logging/logging.dart';

import 'constants/location.dart';
import 'setup.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> setup({scope = "dev", }) async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationsProvider.init();
  await $initGetIt(sl, environment: scope);
  setupI18n(sl);
  setupLogging(
      sl<FileLogAppender>(),
      //todo: Убрать подробробное логирование перед публикаций в сторы
      forceLevel: Level.ALL);

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  };

  Location location = new Location();
  bool _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return;
    }
  }
  location.enableBackgroundMode(enable: true);
  await location.changeSettings(
      interval: LocationConst.locationInterval,
      accuracy: LocationConst.locationAccurancy);
  location.onLocationChanged.listen((LocationData data) async {
    print("onLocationChanged!");
  }, onError: (e, stacktrace) => print('Error during location register'));
  await sl<PackageInfoProvider>().load();
}
