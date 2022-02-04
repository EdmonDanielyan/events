import 'package:flutter/material.dart';
import 'package:ink_mobile/components/highlight_text.dart';
import 'package:substring_highlight/substring_highlight.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final String highlightValue;
  final String? displayName;
  const ChatMessage({
    Key? key,
    required this.message,
    this.displayName,
    this.highlightValue = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (displayName != null) ...[
          HighlightText(
            txt: "${displayName!}:",
            highlightTxt: highlightValue,
            textStyle: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
              fontFamily: Theme.of(context).textTheme.bodyText1!.fontFamily,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          SizedBox(height: 3.0),
        ],
        SubstringHighlight(
          text: message,
          maxLines: 2,
          term: highlightValue,
          textStyle: TextStyle(
            fontSize: 14.0,
            color: Colors.grey[700],
            fontFamily: Theme.of(context).textTheme.bodyText1!.fontFamily,
          ),
          textStyleHighlight: const TextStyle(color: Colors.blue),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}