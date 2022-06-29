import 'dart:io';

import 'package:flutter_logs/flutter_logs.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:logging/logging.dart' as logging;

class CustomLogger {
  static final _globalLogger = logging.Logger('Messenger');
  final logger = Logger();

  bool get logEnabled => true;

  CustomLogger() {
    _exportListener();
  }

  void e(
    String error, {
    StackTrace? stackTrace,
    String? className,
    String? methodName,
  }) {
    if (!logEnabled) {
      return;
    }
    logger.e(error, null, stackTrace);
    _globalLogger.warning(error.toString(), error, stackTrace);
    FlutterLogs.logError(
      className ?? "",
      methodName ?? "",
      error,
    );
  }

  void i(
    String error, {
    StackTrace? stackTrace,
    String? className,
    String? methodName,
  }) {
    if (!logEnabled) {
      return;
    }
    _globalLogger.warning(error.toString(), error, stackTrace);
    logger.i(error, null, stackTrace);
    FlutterLogs.logInfo(
      className ?? "",
      methodName ?? "",
      error,
    );
  }

  Future<void> export(
      {ExportType exportType = ExportType.LAST_24_HOURS}) async {
    try {
      FlutterLogs.exportLogs(
        exportType: exportType,
      );
    } catch (_e, stack) {
      e(
        "$_e",
        stackTrace: stack,
        methodName: "export",
      );
    }
  }

  void _exportListener() {
    if (!logEnabled) {
      return;
    }
    FlutterLogs.channel.setMethodCallHandler((call) async {
      try {
        if (call.method == 'logsExported') {
          var zipName = "${call.arguments}";

          Directory? externalDirectory;

          if (Platform.isIOS) {
            externalDirectory = await getApplicationDocumentsDirectory();
          } else {
            externalDirectory = await getExternalStorageDirectory();
          }

          if (externalDirectory != null) {
            File file = File("${externalDirectory.path}/$zipName");

            if (file.existsSync()) {
              i("Exporting logs...");
              //Share.shareFiles([file.path]);
            }
          }
        }
      } catch (_e, stack) {
        e(
          "$_e",
          stackTrace: stack,
          methodName: "_exportListener",
        );
      }
    });
  }
}

final logger = CustomLogger();
