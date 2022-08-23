import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/components/text/google_style.dart';
import 'package:ink_mobile/messenger/functions/date_functions.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

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
    return GoogleText(
      DateFunctions(dateTime).hourMinute(),
      fontSize: SizeConfig(context, 9.5).getProportionateScreenHeight,
      color: isByMe ? const Color(0XFFFFFFFF) : const Color(0XFF1D2126),
      fontWeight: FontWeight.w300,
    );
  }
}
