import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/auth/auth_cubit.dart';
import 'package:ink_mobile/models/auth_form_data.dart';

class AuthPasswordField extends StatefulWidget {
  const AuthPasswordField({
    Key? key,
  }) : super(key: key);

  @override
  _AuthPasswordFieldState createState() => _AuthPasswordFieldState();
}

class _AuthPasswordFieldState extends State<AuthPasswordField> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

    return TextField(
      onChanged: (value) {
        authCubit.password = _controller.text;
      },
      controller: _controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Пароль',
        border: OutlineInputBorder(),
        fillColor: Colors.white,
        filled: true,
        suffixIcon: IconButton(
            icon: Icon(
                _obscureText
                ? Icons.remove_red_eye
                : Icons.remove_red_eye_outlined
            ),
            onPressed: () {
              _toggle();
            }
        ),
      ),
    );
  }
}
