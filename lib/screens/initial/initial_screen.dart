// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/local_pin_provider.dart';
import 'package:ink_mobile/screens/check_pin_code/check_pin_code_screen.dart';
import 'package:ink_mobile/screens/initial/component/loader.dart';
import 'package:ink_mobile/screens/initial/cubit/initial_cubit.dart';
import 'package:ink_mobile/screens/initial/cubit/initial_state.dart';

class InitPage extends StatefulWidget with Loggable {
  final InitialCubit cubit;

  InitPage({Key? key, required this.cubit}) : super(key: key);

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  final _pinProvider = LocalPinProvider();

  Future<bool> _checkPin() async {
    final token = await Token.getJwt();

    final hasPin = token != null && await _pinProvider.isPinAvailable();

    if (!hasPin) {
      widget.cubit.load();
    }

    return hasPin;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InitialCubit, InitialState>(
      bloc: widget.cubit,
      listener: (context, state) async {
        if (state.type == InitialStateType.LOAD_MAIN) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/app_layer', (route) => false);
        }
        if (state.type == InitialStateType.LOAD_WELCOME) {
          Navigator.popAndPushNamed(context, '/welcome');
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
}
