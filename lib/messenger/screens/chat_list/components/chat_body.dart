import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ink_mobile/messenger/components/highlight_text/highlight_text.dart';

class ChatBody extends StatelessWidget {
  final String body;
  final String title;
  final String highlightValue;
  const ChatBody(
    this.body, {
    Key? key,
    this.title = "",
    this.highlightValue = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.length > 1) ...[
          SubstringHighlight(
            text: title,
            maxLines: 1,
            term: highlightValue,
            textStyle: GoogleFonts.roboto(
              fontSize: 14.0,
              color: const Color(0XFF1D2126),
              fontWeight: FontWeight.w400,
            ),
            strutStyle: const StrutStyle(forceStrutHeight: true),
            textStyleHighlight: const TextStyle(color: Colors.blue),
            overflow: TextOverflow.ellipsis,
          ),
        ],
        SubstringHighlight(
          text: body,
          maxLines: 1,
          term: highlightValue,
          textStyle: GoogleFonts.roboto(
            fontSize: 14.0,
            color: const Color(0XFF757678),
          ),
          strutStyle: const StrutStyle(forceStrutHeight: true),
          textStyleHighlight: const TextStyle(color: Colors.blue),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
