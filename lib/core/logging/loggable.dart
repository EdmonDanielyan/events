import 'package:logging/logging.dart';
import 'package:uuid/uuid.dart';

mixin Loggable {
  Logger? _logger;
  Logger get logger => _logger ?? (_logger = Logger(runtimeType.toString()));
}

mixin Profileable {
  final Map<String, DateTime> _times = {};
  String startProfiling() {
    var id = const Uuid().v4();
    _times[id] = DateTime.now();
    return id;
  }

  int endProfiling(String id) {
    var time = _times[id];
    int result = 0;
    if (time != null) {
      _times.remove(id);
      result = DateTime.now().difference(time).inMilliseconds;
    }
    return result;
  }
}
