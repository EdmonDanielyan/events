import 'package:flutter/material.dart';
import 'package:ink_mobile/screens/auth/components/auth_buttons.dart';
import 'package:ink_mobile/screens/auth/components/auth_hint.dart';
import 'package:ink_mobile/screens/auth/components/background.dart';
import 'package:ink_mobile/screens/auth/components/auth_title.dart';

import 'auth_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
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
