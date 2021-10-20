import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/boot/boot_cubit.dart';

@singleton
class AuthHandler {
  BootCubit bootCubit;

  AuthHandler(this.bootCubit);

  void onSuccessAuth() {
    bootCubit.load();
  }
}
