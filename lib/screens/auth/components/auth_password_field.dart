import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/cubit/auth/auth_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/auth/auth_screen.dart';

import '../../../messenger/functions/size_config.dart';

class AuthPasswordField extends StatefulWidget {
  final AuthCubit authCubit;
  const AuthPasswordField({
    Key? key,
    required this.authCubit,
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

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;

    return TextFormField(
      onChanged: (value) {
        widget.authCubit.password = value;
      },
      initialValue: AuthScreen.of(context).authCubit.password,
      validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: _obscureText,
      style: TextStyle(
        fontSize: SizeConfig(context, 15).getProportionateScreenHeight,
      ),
      decoration: InputDecoration(
        labelText: _strings.password,
        labelStyle: TextStyle(
          fontSize: SizeConfig(context, 13).getProportionateScreenHeight,
        ),
        errorStyle: FontStyles.rubikP3Medium(color: Palette.redF1C),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Palette.text20Grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Palette.text20Grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: Palette.text20Grey),
        ),
        fillColor: Colors.white,
        filled: true,
        suffixIcon: GestureDetector(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SvgPicture.asset(
              _obscureText ? IconLinks.CLOSED_EYE_ICON_LINK : IconLinks.OPENED_EYE_ICON_LINK,
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
