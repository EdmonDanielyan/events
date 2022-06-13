import 'package:injectable/injectable.dart';
import 'listener.dart';

@singleton
class ErrorListener extends Listener {
  @override
  String get event => "";

  @override
  void handler(data) {
    emitTrigger(data);
  }
}
