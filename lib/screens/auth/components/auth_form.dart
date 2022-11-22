import 'package:flutter/material.dart';
import 'package:ink_mobile/cubit/auth/auth_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/screens/auth/auth_screen.dart';

import 'auth_password_field.dart';

class AuthForm extends StatelessWidget {
  final AuthCubit authCubit;
  const AuthForm({Key? key, required this.authCubit}) : super(key: key);

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
              labelStyle: TextStyle(
                fontSize: SizeConfig(context, 13).getProportionateScreenHeight,
              ),
              border: OutlineInputBorder(),
              fillColor: Colors.white,
              filled: true,
              errorStyle: TextStyle(
                fontSize: SizeConfig(context, 12).getProportionateScreenHeight,
              ),
            ),
            style: TextStyle(
              fontSize: SizeConfig(context, 15).getProportionateScreenHeight,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
            initialValue: AuthScreen.of(context).authCubit.login,
            onChanged: (login) {
              authCubit.login = login;
            },
          ),
          SizedBox(height: size.height * 0.03),
          AuthPasswordField(authCubit: authCubit),
        ],
      ),
    );
  }
}
