import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/boot/boot_cubit.dart';
import 'package:ink_mobile/providers/lock_app.dart';

import '../../setup.dart';

@singleton
class AuthHandler {
  BootCubit bootCubit;

  AuthHandler(this.bootCubit);

  Future<void> onSuccessAuth() async {
    final didAuthenticate = await authenticate();
    if (didAuthenticate) {
      bootCubit.load();
    } else {
      exit(0);
    }
  }

  Future<bool> authenticate() async {
    final lockApp = sl.get<LockApp>();
    return await lockApp.authentificate();
  }
}
