import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/screens/error/components/background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;

    return Background(
        child: SingleChildScrollView(
      padding: EdgeInsets.all(20),
      child: Container(
        child: Column(
          children: [
            Text(
              '404',
              style: TextStyle(
                  fontSize: 150,
                  fontWeight: FontWeight.w800,
                  color: Colors.white.withOpacity(0.5),
                  fontFamily: "Helvetica"),
              textAlign: TextAlign.center,
            ),
            Text(
              _strings.pageNotFound,
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontFamily: "Helvetica",
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    ));
  }
}
