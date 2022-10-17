import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

const _appTokenKey = "appToken";

@singleton
class AppTokenProvider {
  final storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));
  String currentToken = "";

  Future<void> setCurrentToken() async {
    currentToken = await getToken() ?? "";
  }

  Future<void> deleteToken() async {
    await storage.delete(key: _appTokenKey);
  }

  Future<String?> getToken() async {
    return await storage.read(key: _appTokenKey);
  }

  Future<void> setToken(String newToken) async {
    await storage.write(key: _appTokenKey, value: newToken);
  }
}
