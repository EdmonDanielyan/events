import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/components/text/google_style.dart';
import 'package:ink_mobile/messenger/functions/date_functions.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class ChatDate extends StatelessWidget {
  final DateTime dateTime;
  const ChatDate(this.dateTime, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFunctions(dateTime).minutesHoursDayMonthYearHuman(),
      style: FontStyles.rubikP3(color: Palette.textBlack50),
    );
  }
}
