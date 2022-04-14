import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

const _key = "chat_import_key";

@singleton
class ChatImportStorage {
  FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<bool> isAvailable() async {
    final savedDate = await getDate();

    if (savedDate != null) {
      return DateTime.now().isAfter(savedDate);
    }

    return true;
  }

  Future<void> setDate() async {
    final date = DateTime.now().add(Duration(days: 1));
    _storage.write(key: _key, value: date.toString());
  }

  Future<DateTime?> getDate() async {
    String? value = await getValue();

    if (value != null) {
      return DateTime.tryParse(value);
    }

    return null;
  }

  Future<String?> getValue() async {
    return _storage.read(key: _key);
  }
}
