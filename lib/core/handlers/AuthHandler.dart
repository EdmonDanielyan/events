import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/boot/boot_cubit.dart';
import 'package:ink_mobile/providers/lock_app.dart';

import '../../setup.dart';

@singleton
class AuthHandler {
  BootCubit bootCubit;

  AuthHandler(this.bootCubit);

  Future<void> onSuccessAuth({bool checkLock = true}) async {
    final didAuthenticate = checkLock ? await authenticate() : true;
    if (didAuthenticate) {
      bootCubit.load();
    } else {
      exit(0);
    }
  }

  Future<bool> authenticate() async {
    final lockApp = sl.get<LockApp>();
    final auth = await lockApp.authentificate();
    if (auth) {
      lockApp.stopAuthentification();
    }
    return auth;
  }
}
