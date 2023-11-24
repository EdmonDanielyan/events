import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/functions/date_functions.dart';

class DateSeparator extends StatelessWidget {
  final DateTime dateTime;
  const DateSeparator({Key? key, required this.dateTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Palette.text5Grey,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Text(
              DateFunctions(dateTime).dayMonthYearHuman(),
              style: FontStyles.rubikP3(color: Palette.textBlack50),
            ),
          ),
        ),
      ),
    );
  }
}
