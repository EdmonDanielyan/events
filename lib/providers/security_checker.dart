import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';

@injectable
class SecurityChecker {
  const SecurityChecker();
  Future<bool> isSafe() async {
    if (kDebugMode){
      return true; // for emulator debug
    }
    final jailBroken = await FlutterJailbreakDetection.jailbroken;
    return !jailBroken;
  }
}
