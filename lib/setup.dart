import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/errors/errors_to_server.dart';
import 'package:ink_mobile/core/logging/file_log_appender.dart';
import 'package:ink_mobile/core/logging/logging.dart';
import 'package:ink_mobile/providers/notifications.dart';

import 'setup.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationsProvider.init();
  await $initGetIt(sl, environment: "dev");
  setupLogging(sl<FileLogAppender>());
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    ErrorsToServer(
      error: details.exception.toString(),
      stack: details.stack.toString(),
    ).send();
    // exit(1);
  };
}
