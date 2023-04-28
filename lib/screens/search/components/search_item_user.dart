import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:ink_mobile/components/cached_image/cached_avatar.dart';
import 'package:ink_mobile/components/highlight_text.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/models/search/data.dart';

class SearchItemUser extends StatelessWidget {
  final UsersSearchData user;
  final String query;

  const SearchItemUser({Key? key, required this.user, required this.query})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/personal', arguments: {'id': user.id});
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedCircleAvatar(
              url: user.avatar,
              avatarHeight: 44.0,
              avatarWidth: 44.0,
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
                      defaultStyle: FontStyles.rubikP2Medium(color: Palette.textBlack),
                      caseSensitive: false,
                      patternList: [
                        EasyRichTextPattern(
                          targetString: RegExp.escape(query),
                          style: FontStyles.rubikP2Medium(color: Palette.blue9CF),
                        ),
                      ],
                    ),
                    if (user.workPosition.isNotEmpty) ...[
                      const SizedBox(height: 7.0),
                      HighlightText(
                        txt: user.workPosition,
                        highlightTxt: query,
                        textStyle: FontStyles.rubikP3(color: Palette.textBlack50),
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
