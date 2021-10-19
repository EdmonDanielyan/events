import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/cubit/auth/auth_cubit.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';

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
    final AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;

    return TextFormField(
      onChanged: (value) {
        authCubit.password = value;
      },
      validator: (val) => val!.isEmpty ? _strings.fillTheField : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: _strings.password,
        border: OutlineInputBorder(),
        fillColor: Colors.white,
        filled: true,
        suffixIcon: GestureDetector(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SvgPicture.asset(
              _obscureText ? SHOW_TEXT_ICON_LINK : HIDE_TEXT_ICON_LINK,
              width: 10,
              height: 10,
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
