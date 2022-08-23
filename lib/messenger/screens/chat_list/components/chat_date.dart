import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/components/text/google_style.dart';
import 'package:ink_mobile/messenger/functions/date_functions.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

class ChatDate extends StatelessWidget {
  final DateTime dateTime;
  const ChatDate(this.dateTime, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleText(
      DateFunctions(dateTime).minutesHoursDayMonthYearHuman(),
      fontSize: SizeConfig(context, 9.5).getProportionateScreenHeight,
      color: const Color(0XFF757678),
      fontWeight: FontWeight.w300,
    );
  }
}
