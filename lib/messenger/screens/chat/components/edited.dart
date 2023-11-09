import 'package:flutter/material.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';

import '../../../components/text/google_style.dart';

class MessageEditedMark extends StatelessWidget {
  final bool isByMe;
  const MessageEditedMark({Key? key, required this.isByMe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleText(
      "Ред.",
      fontStyle: FontStyle.italic,
      // колор
      //  isByMe ? Colors.white : Colors.black87,

      color: isByMe ? Colors.black87 : Colors.black87,
      fontSize: SizeConfig(context, 9.5).getProportionateScreenHeight,
    );
  }
}
