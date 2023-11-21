// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/cubit/logout/logout_cubit.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/messenger/providers/app_token.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/local_pin_provider.dart';
import 'package:ink_mobile/providers/secure_storage.dart';
import 'package:ink_mobile/routes/pass_data_routes.dart';
import 'package:ink_mobile/screens/check_pin_code/check_pin_code_screen.dart';
import 'package:ink_mobile/screens/initial/component/loader.dart';
import 'package:ink_mobile/screens/initial/cubit/initial_cubit.dart';
import 'package:ink_mobile/screens/initial/cubit/initial_state.dart';
import 'package:ink_mobile/setup.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class InitPage extends StatefulWidget with Loggable {
  final InitialCubit cubit;

  InitPage({Key? key, required this.cubit}) : super(key: key);

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  final _pinProvider = LocalPinProvider();
  bool hasPin = false;

  Future<bool> _checkPin() async {
    final token = await Token.getJwt();

    hasPin = token != null && await _pinProvider.isPinAvailable();

    if (!hasPin) {
      await widget.cubit.load();
    }

    return hasPin;
  }

  Future<void> _goToHome(BuildContext context) async {
    Navigator.pushNamedAndRemoveUntil(context, '/app_layer', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InitialCubit, InitialState>(
      bloc: widget.cubit,
      listener: (context, state) async {
        if (state.type == InitialStateType.LOAD_MAIN) {
          if (!hasPin) {
            PassDataRoutes.setPin(context, onComplete: _goToHome);
          } else {
            _goToHome(context);
          }
        }
        if (state.type == InitialStateType.LOAD_WELCOME) {
          _exit(context);
        }
      },
      child: FutureBuilder<bool>(
        future: _checkPin(),
        builder: (context, snap) {
          if (snap.hasData && snap.data != null) {
            bool hasPin = snap.data!;

            if (hasPin) {
              return CheckPinCodeScreen(
                authHandler: widget.cubit.authHandler,
                initialCubit: widget.cubit,
              );
            }
          }

          return const InitScreenLoader();
        },
      ),
    );
  }

  Future<void> _exit(BuildContext context) async {
    getIt<LogoutCubit>().logout();
    getIt<AppTokenProvider>().deleteToken();
    getIt<LocalPinProvider>().removePin();
    getIt<SecureStorage>().deleteAll();
    getIt<MessengerProvider>().dispose();
    getIt<CachedChatsCubit>().clean();
    Token.deleteTokens();
    FlutterSecureStorage().deleteAll();
    // migration
    // OneSignal.shared.removeExternalUserId();
    OneSignal.logout();

    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.pushReplacementNamed(context, '/welcome');
  }
}
