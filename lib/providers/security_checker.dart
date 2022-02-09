import 'package:injectable/injectable.dart';

@injectable
class SecurityChecker {
  const SecurityChecker();
  //todo: Перед выдачей в сторы раскоментировать
  Future<bool> checkApplication() async {
    return true;
    // if (kDebugMode) {
    //   return true;
    // } else {
    //   return !await SafeDevice.isSafeDevice;
    // }
  }
}
