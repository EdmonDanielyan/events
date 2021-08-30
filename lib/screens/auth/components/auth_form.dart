import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/auth/auth_cubit.dart';
import 'auth_password_field.dart';

class AuthForm extends StatelessWidget {
  AuthForm({Key? key}) : super(key: key);

  final TextEditingController _loginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.only(top: size.height * 0.03),
        child: Column(
          children: [
            TextField(
              controller: _loginController,
              decoration: InputDecoration(
                labelText: 'Логин',
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                filled: true,
              ),
              onChanged: (login) {
                authCubit.login = _loginController.text;
              },
            ),
            SizedBox(height: size.height * 0.03),
            AuthPasswordField(),
          ],
        )
    );
  }
}
