import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/core/cubit/int_cubit/int_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/providers/local_pin_provider.dart';

import 'components/pin_code_field.dart';

class SetPinCodeScreen extends StatefulWidget {
  final void Function(BuildContext context)? onComplete;
  const SetPinCodeScreen({Key? key, this.onComplete}) : super(key: key);

  @override
  State<SetPinCodeScreen> createState() => _SetPinCodeScreenState();
}

class _SetPinCodeScreenState extends State<SetPinCodeScreen> {
  final IntCubit _stageCubit = IntCubit(1);
  final TextEditingController _controller = TextEditingController();
  final LocalPinProvider _localPinProvider = LocalPinProvider();
  final focusNode = FocusNode();

  String _pinCode1 = "";
  String _pinCode2 = "";

  void _onComplete1(BuildContext context) {
    _stageCubit.setNew(2);
    _controller.clear();
    _pinCode2 = "";
    Future.delayed(const Duration(milliseconds: 200), () {
      focusNode.requestFocus();
    });
  }

  void _onComplete2(BuildContext context) {
    if (_pinCode2 == _pinCode1) {
      _localPinProvider.setPin(_pinCode2);

      if (widget.onComplete != null) {
        widget.onComplete!(context);
      } else {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    return Scaffold(
      appBar: AppBar(
        title: Text(_strings.setPinCode),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<IntCubit, int>(
          bloc: _stageCubit,
          builder: (context, state) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 32.0, horizontal: 20.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      state == 2 ? _strings.repeatPinCode : _strings.newPinCode,
                      style: FontStyles.rubikH2(color: Palette.textBlack),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Center(
                    child: PinCodeTextField(
                      controller: _controller,
                      focusNode: focusNode,
                      errorBuilder: (str, str2) {
                        if (str2 == _pinCode1) return const SizedBox.shrink();

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              str ?? "",
                              style: const TextStyle(
                                  fontSize: 13.0, color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      },
                      validator: (str) {
                        if (state == 2) {
                          if (str != _pinCode1) {
                            return _strings.incorrectPinCode;
                          }
                        }

                        return null;
                      },
                      onChanged: (str) {
                        if (str.isNotEmpty) {
                          if (state == 2) {
                            _pinCode2 = str;
                          } else {
                            _pinCode1 = str;
                          }
                        }
                      },
                      onCompleted: (pin) => state == 2
                          ? _onComplete2(context)
                          : _onComplete1(context),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  if (state == 2) ...[
                    TextButton(
                      child: Text(_strings.clear),
                      onPressed: () {
                        _controller.clear();
                        _pinCode1 = "";
                        _stageCubit.setNew(1);
                      },
                    )
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
