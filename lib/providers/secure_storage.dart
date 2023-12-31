import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/models/token.dart';

@lazySingleton
class SecureStorage {
  final FlutterSecureStorage _prefs = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.passcode),
  );

  Future<String?> read(String key) async {
    return _prefs.read(key: key);
  }

  Future<void> deleteAll() async {
    await _prefs.delete(key: TokenTypes.jwt.key);
    await _prefs.delete(key: TokenTypes.localDbToken.key);
    await _prefs.delete(key: TokenTypes.refresh.key);
    await _prefs.deleteAll();
  }

  Future<void> write({required String key, required String value}) {
    return _prefs.write(key: key, value: value);
  }

  Future<bool> containsKey(String key) {
    return _prefs.containsKey(key: key);
  }
}
