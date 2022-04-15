import 'package:flutter/material.dart';
import 'package:substring_highlight/substring_highlight.dart';

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
    return SubstringHighlight(
      text: name,
      maxLines: 1,
      term: highlightValue,
      textStyle: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: "Noto",
      ),
      strutStyle: StrutStyle(forceStrutHeight: true),
      textStyleHighlight: const TextStyle(color: Colors.blue),
      overflow: TextOverflow.ellipsis,
    );
  }
}
