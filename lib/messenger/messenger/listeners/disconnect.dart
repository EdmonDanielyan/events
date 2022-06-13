import 'package:injectable/injectable.dart';
import 'listener.dart';

@singleton
class DisconnectListener extends Listener {
  @override
  String get event => "";

  @override
  void handler(data) {
    emitTrigger(data);
  }
}
