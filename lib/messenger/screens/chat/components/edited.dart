import 'package:flutter/material.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';

class MessageEditedCard extends StatelessWidget {
  final Brightness brightness;
  const MessageEditedCard({Key? key, required this.brightness})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      localizationInstance.edited,
      style: TextStyle(
        fontSize: 10.0,
        color: brightness == Brightness.dark ? Colors.grey[50] : Colors.black,
      ),
    );
  }
}
