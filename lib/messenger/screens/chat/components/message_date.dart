import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/functions/date_functions.dart';

class MessageDate extends StatelessWidget {
  final DateTime dateTime;
  final bool isByMe;
  const MessageDate(
    this.dateTime, {
    Key? key,
    this.isByMe = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      DateFunctions(dateTime).hourMinute(),
      style: FontStyles.rubikP3(
        color: isByMe
            // колор
            // Palette.white.withOpacity(0.5
            ? Palette.text20Grey
            : Palette.text20Grey,
      ),
    );
  }
}
