import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';

class SearchItemText extends StatelessWidget {
  final int id;
  final String title;
  final String query;
  final String route;
  final bool isLastItem;

  const SearchItemText({
    Key? key,
    required this.id,
    required this.title,
    required this.query,
    required this.route,
    required this.isLastItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route, arguments: {'id': id});
        },
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(bottom: 16.0),
              child: EasyRichText(
                title,
                caseSensitive: false,
                defaultStyle: FontStyles.rubikP1(color: Palette.textBlack),
                patternList: [
                  EasyRichTextPattern(
                    targetString: RegExp.escape(query),
                    style: FontStyles.rubikP1(color: Palette.blue9CF),
                  ),
                ],
              ),
            ),
            if (!isLastItem)
              Divider(
                color: Palette.text20Grey,
                thickness: 1,
              )
          ],
        ),
      ),
    );
  }
}
