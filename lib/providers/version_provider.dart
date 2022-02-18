import 'package:ink_mobile/providers/package_info.dart';
import 'package:ink_mobile/providers/secure_storage.dart';

const _VERSION_KEY = "version";

class VersionProvider {
  final PackageInfoProvider packageInfoProvider;

  const VersionProvider(this.packageInfoProvider);

  Future<String?> get storedVersion async =>
      await SecureStorage().read(_VERSION_KEY);

  String get currentVersion => packageInfoProvider.version;

  Future<void> setToStore(String version) async {
    await SecureStorage().write(key: _VERSION_KEY, value: version);
  }
}
