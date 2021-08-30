import 'package:flutter/material.dart';

class AuthTitle extends StatelessWidget {
  const AuthTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Авторизация',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
