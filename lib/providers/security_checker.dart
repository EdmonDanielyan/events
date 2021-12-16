import 'package:injectable/injectable.dart';
import 'package:safe_device/safe_device.dart';

@injectable
class SecurityChecker {
  const SecurityChecker();

  Future<bool> checkApplication() async {
    //TODO DELETE THIS
    return !await SafeDevice.isJailBroken;
    //return !await SafeDevice.isSafeDevice && !await SafeDevice.isJailBroken;
  }
}
