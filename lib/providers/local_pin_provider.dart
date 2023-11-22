import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

const _pinKey = "pincode";
const _triesKey = "pincodeTry";
const _lastTryKey = "lastPinCodeTry";

const _tries = 5;

@LazySingleton()
class LocalPinProvider {
  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.passcode,
    ),
  );

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

  Future<bool> checkPincode(String code) async {
    final myPin = await getPin ?? "";
    final myTries = await _getTries();
    final getLastTryTime = await _getLastTry();
    final thirtyMinutesBefore =
        DateTime.now().subtract(const Duration(minutes: 30));

    int setTries = myTries - 1;
    DateTime setLastTry = DateTime.now();
    bool isOk = false;

    if ((getLastTryTime == null ||
            thirtyMinutesBefore.isAfter(getLastTryTime)) ||
        myTries >= 1) {
      if (myPin.isNotEmpty && myPin == code) {
        setTries = _tries;
        setLastTry = DateTime.fromMillisecondsSinceEpoch(0);
        isOk = true;
      }
    }

    _setTries(setTries);
    _setLastTry(setLastTry);

    if (setTries < 1) {
      throw PincodeTriesExpired();
    }

    return isOk;
  }

  Future<void> resetTries() async {
    await _setLastTry(DateTime.fromMillisecondsSinceEpoch(0));
    await _setTries(_tries);
  }

  Future<void> _setLastTry(DateTime date) async {
    await _flutterSecureStorage.write(
        key: _lastTryKey, value: date.millisecondsSinceEpoch.toString());
  }

  Future<DateTime?> _getLastTry() async {
    if (await _flutterSecureStorage.containsKey(key: _lastTryKey)) {
      final timeInMilliseconds =
          await _flutterSecureStorage.read(key: _lastTryKey);

      return DateTime.fromMillisecondsSinceEpoch(
          int.tryParse(timeInMilliseconds ?? "0") ?? 0);
    }

    return null;
  }

  Future<void> _setTries(int tries) async {
    await _flutterSecureStorage.write(key: _triesKey, value: tries.toString());
  }

  Future<int> _getTries() async {
    if (await _flutterSecureStorage.containsKey(key: _triesKey)) {
      final _triesStr = await _flutterSecureStorage.read(key: _triesKey);

      return int.tryParse(_triesStr ?? "5") ?? _tries;
    }

    return _tries;
  }
}

class PincodeTriesExpired implements Exception {}
