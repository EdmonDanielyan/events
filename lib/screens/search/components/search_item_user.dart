import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:ink_mobile/components/cached_image/cached_avatar.dart';
import 'package:ink_mobile/components/highlight_text.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/models/search/data.dart';

class SearchItemUser extends StatelessWidget {
  final UsersSearchData user;
  final String query;

  const SearchItemUser({Key? key, required this.user, required this.query})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, '/personal', arguments: {'id': user.id});
      },
      child: Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: CachedCircleAvatar(
                url: user.avatar,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EasyRichText(
                      user.fullName,
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                      defaultStyle: TextStyle(
                          color: Color(0xFF1D2126),
                          fontSize: SizeConfig(context, 20).getProportionateScreenHeight,
                          fontWeight: FontWeight.w400),
                      caseSensitive: false,
                      patternList: [
                        EasyRichTextPattern(
                          targetString: RegExp.escape(query),
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                    if (user.workPosition.isNotEmpty) ...[
                      const SizedBox(height: 7.0),
                      HighlightText(
                        txt: user.workPosition,
                        highlightTxt: query,
                        textStyle: TextStyle(
                          fontSize: SizeConfig(context, 12.5).getProportionateScreenHeight,
                          color: Colors.grey,
                        ),
                        maxLines: 4,
                      ),
                    ],
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
