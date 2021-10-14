import 'package:injectable/injectable.dart';

@singleton
class NatsProvider {
  Future<bool> load() async {
    print("NATS!");
    return true;
  }
}
