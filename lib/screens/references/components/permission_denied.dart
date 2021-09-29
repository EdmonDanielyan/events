import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';

class PermissionDenied extends StatelessWidget {
  const PermissionDenied({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
      child: Center(
          child: Text(
        _strings.accessRightsReferInfo,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, color: Color(0xFF2B5E4A)),
      )),
    );
  }
}
