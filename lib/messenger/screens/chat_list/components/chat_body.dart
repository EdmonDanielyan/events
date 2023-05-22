import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/components/highlight_text/highlight_text.dart';

import '../../../functions/size_config.dart';

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
            textStyle: FontStyles.rubikP2(color: Palette.greenE4A),
            strutStyle: const StrutStyle(forceStrutHeight: true),
            textStyleHighlight: FontStyles.rubikP2(color: Palette.greenE4A),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
              height: SizeConfig(context, 3.0).getProportionateScreenHeight)
        ],
        SubstringHighlight(
          text: body,
          maxLines: 1,
          term: highlightValue,
          textStyle: FontStyles.rubikP2(color: Palette.textBlack50),
          strutStyle: const StrutStyle(forceStrutHeight: true),
          textStyleHighlight: FontStyles.rubikP2(color: Palette.greenE4A),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
