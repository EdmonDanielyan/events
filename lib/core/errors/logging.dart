import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

import 'file_log_appender.dart';

void setupLogging(FileLogAppender fileLogAppender,
    {
    bool printToConsole: true,
    Level? forceLevel}) {
  Logger.root.level = forceLevel ?? (kDebugMode ? Level.ALL : Level.WARNING);
  fileLogAppender.printLogs = true;
  Logger.root.onRecord.listen((record) {
    var tail = "";
    if (record.error != null) tail+= ": ${record.error}";
    if (record.stackTrace != null) tail+= "\n${record.stackTrace}";
    var s =
        '${record.time} [${record.level}] [${record.loggerName}] ${record.message}$tail';
    fileLogAppender.append(s);
    if (printToConsole) debugPrint(s, wrapWidth: 1000);
  });
}
