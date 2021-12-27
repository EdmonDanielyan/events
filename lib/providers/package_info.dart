
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:package_info_plus/package_info_plus.dart';

@lazySingleton
class PackageInfoProvider with Loggable{
  late String _version;

  String get version => _version;

  Future load() async {
    var _packageInfo = await PackageInfo.fromPlatform();
    _version = "v${_packageInfo.version}(build: ${_packageInfo.buildNumber})";
    logger.warning("Application version: $_version");
  }
}
