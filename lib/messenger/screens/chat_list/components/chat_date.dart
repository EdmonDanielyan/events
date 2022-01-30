import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/utils/date_functions.dart';

class ChatDate extends StatelessWidget {
  final DateTime chatDate;
  const ChatDate({Key? key, required this.chatDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFunctions(passedDate: chatDate).displayTimeForTodayOrDate(),
      style: TextStyle(color: Colors.grey, fontSize: 13.0),
    );
  }
}
