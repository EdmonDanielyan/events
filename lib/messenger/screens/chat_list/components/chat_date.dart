import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/components/text/google_style.dart';
import 'package:ink_mobile/messenger/functions/date_functions.dart';

class ChatDate extends StatelessWidget {
  final DateTime dateTime;
  const ChatDate(this.dateTime, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleText(
      DateFunctions(dateTime).hourMinute(),
      fontSize: 11.0,
      color: const Color(0XFF757678),
      fontWeight: FontWeight.w300,
    );
  }
}
