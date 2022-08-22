import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/auth/auth_screen.dart';

import '../../../messenger/functions/size_config.dart';

class AuthPasswordField extends StatefulWidget {
  const AuthPasswordField({
    Key? key,
  }) : super(key: key);

  @override
  _AuthPasswordFieldState createState() => _AuthPasswordFieldState();
}

class _AuthPasswordFieldState extends State<AuthPasswordField> {
  bool _obscureText = true;

  static const String SHOW_TEXT_ICON_LINK = 'assets/images/show_text_icon.svg';
  static const String HIDE_TEXT_ICON_LINK = 'assets/images/hide_text_icon.svg';

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;

    return TextFormField(
      onChanged: (value) {
        AuthScreen.of(context).authCubit.password = value;
      },
      initialValue: AuthScreen.of(context).authCubit.password,
      validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: _obscureText,
      style: TextStyle(
        fontSize: SizeConfig(context, 13).getProportionateScreenHeight,
      ),
      decoration: InputDecoration(
        labelText: _strings.password,
        labelStyle: TextStyle(
          fontSize: SizeConfig(context, 13).getProportionateScreenHeight,
        ),
        errorStyle: TextStyle(
          fontSize: SizeConfig(context, 12).getProportionateScreenHeight,
        ),
        border: OutlineInputBorder(),
        fillColor: Colors.white,
        filled: true,
        suffixIcon: GestureDetector(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SvgPicture.asset(
              _obscureText ? SHOW_TEXT_ICON_LINK : HIDE_TEXT_ICON_LINK,
              width: SizeConfig(context, 8.0).getProportionateScreenHeight,
              height: SizeConfig(context, 8.0).getProportionateScreenHeight,
            ),
          ),
          onTap: () {
            _toggle();
          },
        ),
      ),
    );
  }
}
