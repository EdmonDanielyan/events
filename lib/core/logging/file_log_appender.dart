import 'dart:async';
import 'dart:io';

import 'package:injectable/injectable.dart';

import 'device_info_printer.dart';

@lazySingleton
class FileLogAppender with DeviceInfoPrinter {
  bool get shouldLog => false;
  String logFile;
  final List<String> _recordsCache = [];
  Timer? _timer;
  File? _file;

  bool printLogs = false;
  Duration retentionCachePeriod = const Duration(milliseconds: 500);
  int logFileSizeBytes = 50000000;

  FileLogAppender(@Named('logFile') this.logFile) {
    assert(logFile.isNotEmpty, "logFile should not be empty");
    _ensureLogFile();
  }

  void append(String record) async {
    if (!shouldLog) {
      return;
    }

    _recordsCache.add(record);

    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer(retentionCachePeriod, () => _processCache());
  }

  Future<void> _processCache() async {
    if (!shouldLog) {
      return;
    }

    try {
      await _ensureLogFile();
      var _list = _recordsCache.toList();
      _list.forEach((r) async => await _processRecord(r));
      _recordsCache.removeRange(0, _list.length);
    } catch (exc, stackTrace) {
      _printLog("Exception occurred: $exc stack: $stackTrace");
    }
  }

  Future<bool> _processRecord(String record) async {
    if (!shouldLog) {
      return false;
    }

    if (_file != null) {
      try {
        _writeReportToFile(record);
        _printLog(record);
        return true;
      } catch (e) {
        print(e);
      }
    }
    return false;
  }

  Future<bool> _ensureLogFile() async {
    if (!shouldLog) {
      return false;
    }

    try {
      _file ??= File(logFile);
      bool exists = _file!.existsSync();
      if (!exists) {
        _file!.createSync();
        await addDeviceInfo(_file!);
      } else if (_file!.lengthSync() > logFileSizeBytes) {
        _file!.deleteSync();
        _file!.createSync();
        await addDeviceInfo(_file!);
      }
      return true;
    } catch (exc, stackTrace) {
      _printLog(
          "Exception occurred during check log file: $exc stacktrace: $stackTrace");
      return false;
    }
  }

  void _writeLineToFile(String text) {
    if (!shouldLog) {
      return;
    }

    _file?.writeAsStringSync('$text\n', mode: FileMode.append, flush: true);
  }

  Future<void> _writeReportToFile(String report) async {
    if (!shouldLog) {
      return;
    }

    //_printLog("Writing report to file");
    _writeLineToFile(report);
  }

  void _printLog(String log) {
    if (!shouldLog) {
      return;
    }

    if (printLogs) {
      print(log);
    }
  }
}
