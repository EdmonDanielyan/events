import 'package:flutter/material.dart';
import 'package:ink_mobile/components/highlight_text.dart';

class ChatName extends StatelessWidget {
  final String name;
  final String highlightValue;
  const ChatName({
    Key? key,
    required this.name,
    this.highlightValue = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HighlightText(
      txt: name,
      highlightTxt: highlightValue,
      textStyle: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: Theme.of(context).textTheme.bodyText1!.fontFamily,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
