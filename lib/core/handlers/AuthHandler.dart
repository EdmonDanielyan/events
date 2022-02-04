import 'dart:io';

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

  Future<void> authChallenge({bool pass = false}) async {
    if (pass) {
      await bootCubit.load();
      return;
    }

    for (var i = 0; i < LOCAL_AUTH_MAX_ATTEMPTS - 1; i++) {
      logger.severe("Attempting authenticate");
      if (await authenticate()) {
        await bootCubit.load();
        return;
      }
    }
    logger.severe(() =>
        "$LOCAL_AUTH_MAX_ATTEMPTS attempts of auth failed. Exit application");
    exit(0);
  }

  Future<void> byPassChallenge() async {
    await bootCubit.load();
  }

  Future<bool> authenticate() async {
    final lockApp = sl.get<LockApp>();
    await lockApp.stopAuthentification();
    final auth = await lockApp.authenticate();
    if (auth) {
      await lockApp.stopAuthentification();
    }
    return auth;
  }
}
