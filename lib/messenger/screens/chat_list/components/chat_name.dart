import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ink_mobile/messenger/components/highlight_text/highlight_text.dart';

class ChatName extends StatelessWidget {
  final String name;
  final String highlightValue;
  const ChatName(this.name, {Key? key, this.highlightValue = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SubstringHighlight(
      text: name,
      maxLines: 1,
      term: highlightValue,
      textStyle: GoogleFonts.roboto(
        fontWeight: FontWeight.bold,
        fontSize: 15.0,
        color: Colors.black,
      ),
      strutStyle: const StrutStyle(forceStrutHeight: true),
      textStyleHighlight: const TextStyle(color: Colors.blue),
      overflow: TextOverflow.ellipsis,
    );
  }
}
