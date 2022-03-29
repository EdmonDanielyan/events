import 'package:injectable/injectable.dart';
import 'package:ink_mobile/constants/auth.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/cubit/boot/boot_cubit.dart';
import 'package:ink_mobile/providers/lock_app.dart';

import '../../setup.dart';

@singleton
class AuthHandler with Loggable {
  BootCubit bootCubit;

  AuthHandler(this.bootCubit);

  Future<bool> authChallenge({bool pass = false}) async {
    if (pass) {
      await bootCubit.load();
      return true;
    }

    logger.severe("Attempting authenticate");
    for (int i = 0; i < LOCAL_AUTH_MAX_ATTEMPTS; i++) {
      if (await authenticate()) {
        await bootCubit.load();
        return true;
      }
    }

    logger.severe(() => "Auth failed");

    return false;
  }

  Future<void> byPassChallenge() async {
    await bootCubit.load();
  }

  Future<bool> authenticate() async {
    final lockApp = sl.get<LockApp>();

    final auth = await lockApp.authenticate();

    if (auth) {
      await lockApp.stopAuthentification();
    }
    return auth;
  }
}
