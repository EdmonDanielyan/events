import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/cubit/auth/auth_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/auth/auth_screen.dart';

import 'auth_password_field.dart';

class AuthForm extends StatelessWidget {
  final AuthCubit authCubit;
  final bool hasError;
  const AuthForm({
    Key? key,
    required this.authCubit,
    this.hasError = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: size.height * 0.03),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: _strings.login,
              labelStyle: FontStyles.rubikP2(color: Palette.textBlack50),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: hasError ? Palette.redF1C : Palette.text20Grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: hasError ? Palette.redF1C : Palette.text20Grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: hasError ? Palette.redF1C : Palette.text20Grey),
              ),
              fillColor: Colors.white,
              filled: true,
              errorStyle: FontStyles.rubikP3Medium(color: Palette.redF1C),
            ),
            style: FontStyles.rubikP2(color: Palette.textBlack),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
            initialValue: AuthScreen.of(context).authCubit.login,
            onChanged: (login) {
              authCubit.clearErrors();
              authCubit.login = login;
            },
          ),
          const SizedBox(height: 24.0),
          AuthPasswordField(authCubit: authCubit, hasError: hasError,),
        ],
      ),
    );
  }
}
