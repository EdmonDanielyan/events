import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/core/cubit/bool_cubit/bool_cubit.dart';
import 'package:ink_mobile/core/cubit/bool_cubit/bool_state.dart';
import 'package:ink_mobile/core/handlers/AuthHandler.dart';
import 'package:ink_mobile/core/logging/loggable.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/providers/local_pin_provider.dart';
import 'package:ink_mobile/providers/lock_app.dart';
import 'package:ink_mobile/screens/initial/cubit/initial_cubit.dart';
import 'package:ink_mobile/screens/set_pin_code/components/pin_code_field.dart';
import 'package:ink_mobile/setup.dart';

class CheckPinCodeScreen extends StatefulWidget {
  final AuthHandler authHandler;
  final InitialCubit initialCubit;
  const CheckPinCodeScreen({
    Key? key,
    required this.authHandler,
    required this.initialCubit,
  }) : super(key: key);

  @override
  _CheckPinCodeScreenState createState() => _CheckPinCodeScreenState();
}

class _CheckPinCodeScreenState extends State<CheckPinCodeScreen> with Loggable {
  final lockApp = sl.get<LockApp>();
  final LocalPinProvider _localPinProvider = LocalPinProvider();
  String _myPin = "";
  final BoolCubit _loadingCubit = BoolCubit(false);
  final BoolCubit _canCheckBiometrics = BoolCubit(false);
  final List<String> tries = [];

  @override
  void initState() {
    super.initState();

    _showBiometrics();
    _setPin();
  }

  Future<void> _setPin() async {
    _myPin = await _localPinProvider.getPin ?? "";
  }

  Future<void> _success() async {
    _loadingCubit.setNew(true);
    await widget.initialCubit.load();
  }

  Future<void> _showBiometrics() async {
    if (await lockApp.canCheckBiometrics()) {
      _canCheckBiometrics.setNew(true);
      final success = await lockApp.authenticate();

      if (success) {
        await lockApp.stopAuthentification();
        _success();
      }
    }
  }

  Future<void> _onCompleted(String pin, BuildContext context) async {
    tries.add(pin);
    if (_myPin == pin) {
      _success();
    } else {
      if (tries.length >= 5) {
        _logOut(context);
      }
    }
  }

  Future<void> _logOut(BuildContext context) async {
    await _localPinProvider.removePin();
    await Token.deleteTokens();
    Navigator.of(context).popAndPushNamed("/init");
  }

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    return Scaffold(
      body: Center(
        child: BlocBuilder<BoolCubit, BoolState>(
          bloc: _loadingCubit,
          builder: (context, state) {
            if (state.enable) {
              return CircularProgressIndicator();
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20.0),
                  Text(
                    _strings.authenticationRequired,
                    style: const TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                  const SizedBox(height: 40.0),
                  Center(
                    child: PinCodeTextField(
                      onCompleted: (str) => _onCompleted(str, context),
                      validator: (str) {
                        if (str != _myPin) {
                          return _strings.incorrectPinCode;
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  BlocBuilder<BoolCubit, BoolState>(
                    bloc: _canCheckBiometrics,
                    builder: (context, state) {
                      if (state.enable) {
                        return IconButton(
                          onPressed: _showBiometrics,
                          icon: Icon(Icons.fingerprint,
                              color: Theme.of(context).primaryColor),
                          iconSize: 40.0,
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
