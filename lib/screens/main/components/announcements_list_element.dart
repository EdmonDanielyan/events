import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:intl/intl.dart';

import '../../../messenger/functions/size_config.dart';

class AnnouncementsListElement extends StatelessWidget {
  final AnnouncementData announcement;
  const AnnouncementsListElement({Key? key, required this.announcement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/announcement_detail',
            arguments: {'id': announcement.id});
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Text(
                    announcement.dateCreate != null
                        ? DateFormat('dd.MM.yyyy')
                            .format(announcement.dateCreate!)
                        : '',
                    style: FontStyles.rubikP2(color: Palette.textBlack50),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              alignment: Alignment.topLeft,
              child: Text(
                announcement.title ?? '',
                style: FontStyles.rubikH4(color: Palette.textBlack),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              child: Row(
                children: [
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: SvgPicture.asset(
                            IconLinks.OPENED_EYE_ICON_LINK,
                            height: 16.0,
                            width: 16.0,
                            color: Palette.textBlack50,
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        Container(
                          child: Text(
                            announcement.viewCount != null
                                ? announcement.viewCount.toString()
                                : '0',
                            style:
                                FontStyles.rubikP2(color: Palette.textBlack50),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
