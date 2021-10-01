import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';

class AuthHint extends StatelessWidget {
  const AuthHint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;

    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: size.height * 0.03),
            child: Opacity(
                opacity: 0.6,
                child: Text(
                  _strings.authHint,
                  style: TextStyle(fontSize: 12, color: Color(0xFF1D2126)),
                ))),
      ],
    );
  }
}
