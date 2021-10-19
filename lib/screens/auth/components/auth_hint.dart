import 'package:flutter/material.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

class AuthHint extends StatelessWidget {
  const AuthHint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: size.height * 0.03),
          child: Opacity(
            opacity: 0.6,
            child: Text(
              localizationInstance.authHint,
              style: TextStyle(fontSize: 12, color: Color(0xFF1D2126)),
            ),
          ),
        ),
      ],
    );
  }
}
