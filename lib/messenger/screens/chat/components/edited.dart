import 'package:flutter/material.dart';

import '../../../components/text/google_style.dart';

class MessageEditedMark extends StatelessWidget {
  final bool isByMe;
  const MessageEditedMark({Key? key, required this.isByMe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleText(
      "Ред.",
      fontStyle: FontStyle.italic,
      color: isByMe ? Colors.white : Colors.black87,
      fontSize: 11.0,
    );
  }
}
