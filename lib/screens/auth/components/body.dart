import 'package:flutter/material.dart';
import 'package:ink_mobile/screens/auth/components/auth_buttons.dart';
import 'package:ink_mobile/screens/auth/components/auth_hint.dart';
import 'package:ink_mobile/screens/auth/components/background.dart';
import 'package:ink_mobile/screens/auth/components/auth_title.dart';

import 'auth_form.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AuthTitle(),
                    ],
                  ),
                  AuthForm(),
                  Expanded(
                      child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      AuthHint(),
                      AuthButtons(formKey: formKey),
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
