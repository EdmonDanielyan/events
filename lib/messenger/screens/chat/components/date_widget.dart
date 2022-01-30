import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/utils/date_functions.dart';

class DateWidget extends StatelessWidget {
  final DateTime? dateTime;
  const DateWidget({Key? key, required this.dateTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (dateTime == null) return const SizedBox();

    String humanDate = DateFunctions(passedDate: dateTime!).dayMonthYearHuman();

    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        humanDate,
        style: TextStyle(fontSize: 11.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
