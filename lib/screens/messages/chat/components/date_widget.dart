import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/functions/date_functions.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';

class DateWidget extends StatelessWidget {
  final DateTime? dateTime;
  const DateWidget({Key? key, required this.dateTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (dateTime == null) return SizedBox();

    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;

    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        DateFunctions(passedDate: dateTime!).dayMonthYearHuman(_strings),
        style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
