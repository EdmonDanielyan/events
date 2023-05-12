import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/cubit/auth/auth_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/auth/auth_screen.dart';


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
      style: FontStyles.rubikP2(color: Palette.textBlack),
      decoration: InputDecoration(
        labelText: _strings.password,
        labelStyle: FontStyles.rubikP2(color: Palette.textBlack50),
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
            padding: EdgeInsets.only(top: 16, bottom: 16, right: 16),
            child: SvgPicture.asset(
              _obscureText ? IconLinks.CLOSED_EYE_ICON_LINK : IconLinks.OPENED_EYE_ICON_LINK,
              width: 20.0,
              height: 20.0,
              color: Palette.greenE4A,
            ),
          ),
          onTap: _toggle,
        ),
      ),
    );
  }
}
