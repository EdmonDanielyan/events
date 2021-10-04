import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/functions/launch_url.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';

class SignInInstructions extends StatelessWidget {
  final Color txtColor;
  const SignInInstructions({Key? key, this.txtColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    return TextButton(
      onPressed: () {
        launchUrl('https://portal.irkutskoil.ru/');
      },
      child: Opacity(
        opacity: 0.6,
        child: Text(
          _strings.signInInstructions,
          style: TextStyle(
            color: txtColor,
            fontSize: 12,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
