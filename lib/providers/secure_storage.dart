import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SecureStorage {
  final FlutterSecureStorage _prefs = FlutterSecureStorage();

  Future<String?> read(String key) async {
    return _prefs.read(key: key);
  }

  Future<void> deleteAll() {
    return _prefs.deleteAll();
  }

  Future<void> write({required String key, required String value}) {
    return _prefs.write(key: key, value: value);
  }

  Future<bool> containsKey(String key) {
    return _prefs.containsKey(key: key);
  }
}
