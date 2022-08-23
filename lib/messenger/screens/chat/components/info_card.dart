import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/components/text/google_style.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/messenger/model/message.dart';

class MessageInfoCard extends StatelessWidget {
  final Message message;
  const MessageInfoCard(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 7.0),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: GoogleText(
          message.body,
          fontSize: SizeConfig(context, 11.5).getProportionateScreenHeight,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
