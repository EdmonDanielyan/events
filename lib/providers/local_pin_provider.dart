import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _pinKey = "pincode";

class LocalPinProvider {
  FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));

  Future<bool> isPinAvailable() async {
    final pinCode = await getPin;

    return pinCode != null && pinCode.isNotEmpty;
  }

  Future<String?> get getPin async {
    return await _flutterSecureStorage.read(key: _pinKey);
  }

  Future<void> setPin(String value) async {
    await _flutterSecureStorage.write(key: _pinKey, value: value);
  }

  Future<void> removePin() async {
    if (await _flutterSecureStorage.containsKey(key: _pinKey)) {
      await _flutterSecureStorage.delete(key: _pinKey);
    }
  }
}
