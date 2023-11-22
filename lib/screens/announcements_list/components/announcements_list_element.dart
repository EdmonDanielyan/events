import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

class AnnouncementsListElement extends StatelessWidget {
  static const String DEFAULT_PREVIEW_PICTURE_LINK =
      'assets/images/default_news.jpg';
  final AnnouncementData announcement;

  const AnnouncementsListElement({Key? key, required this.announcement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/announcement_detail',
            arguments: {'id': announcement.id});
      },
      child: SizedBox(
        width: size.width,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                announcement.dateCreate != null
                    ? DateFormat('dd.MM.yyyy').format(announcement.dateCreate!)
                    : '',
                style: FontStyles.rubikP2(color: Palette.textBlack50),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              alignment: Alignment.topLeft,
              child: Text(
                announcement.title ?? '',
                style: FontStyles.rubikH4(color: Palette.textBlack),
                maxLines: 4,
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.only(top: 16.0),
              child: Row(
                children: [
                  SvgPicture.asset(IconLinks.OPENED_EYE_ICON_LINK,
                      width: 16.0,
                      height: 16.0,
                      colorFilter: ColorFilter.mode(
                          Palette.textBlack50, BlendMode.srcIn)),
                  Container(
                    margin: const EdgeInsets.only(left: 4),
                    child: Text(
                      announcement.viewCount != null
                          ? announcement.viewCount.toString()
                          : '0',
                      style: FontStyles.rubikP2(color: Palette.textBlack50),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Share.share(
                            'https://portal.irkutskoil.ru/announcements/${announcement.id}/');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Icon(Icons.share,
                            size: 16, color: Palette.textBlack50),
                      )),
                ],
              ),
            ),
            Divider(
              color: Palette.text20Grey,
              height: 48.0,
            ),
          ],
        ),
      ),
    );
  }
}
