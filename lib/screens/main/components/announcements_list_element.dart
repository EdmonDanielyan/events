import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Row(
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
            Container(
              margin: const EdgeInsets.only(top: 8),
              alignment: Alignment.topLeft,
              child: Text(
                announcement.title ?? '',
                style: FontStyles.rubikH4(color: Palette.textBlack),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25),
              child: Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 3),
                        child: SvgPicture.asset(IconLinks.OPENED_EYE_ICON_LINK,
                            height: 16.0,
                            width: 16.0,
                            colorFilter: ColorFilter.mode(
                                Palette.textBlack50, BlendMode.srcIn)),
                      ),
                      const SizedBox(width: 5.0),
                      Text(
                        announcement.viewCount != null
                            ? announcement.viewCount.toString()
                            : '0',
                        style: FontStyles.rubikP2(color: Palette.textBlack50),
                      ),
                      InkWell(
                          onTap: () {
                            Share.share(
                                'https://portal.irkutskoil.ru/announcements/${announcement.id}/');
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 8),
                            child: Icon(Icons.share,
                                size: 16, color: Palette.textBlack50),
                          )),
                    ],
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
