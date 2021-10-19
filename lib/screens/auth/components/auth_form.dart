import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/auth/auth_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'auth_password_field.dart';

class AuthForm extends StatelessWidget {
  AuthForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    final _strings = localizationInstance;
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.only(top: size.height * 0.03),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: _strings.login,
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
              onChanged: (login) {
                authCubit.login = login;
              },
            ),
            SizedBox(height: size.height * 0.03),
            AuthPasswordField(),
          ],
        ));
  }
}
