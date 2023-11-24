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
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              announcement.dateCreate != null
                  ? DateFormat('dd.MM.yyyy').format(announcement.dateCreate!)
                  : '',
              style: FontStyles.rubikP2(color: Palette.textBlack50),
            ),
            const SizedBox(height: 8),
            Text(
              announcement.title ?? '',
              style: FontStyles.rubikH4(color: Palette.textBlack),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 21),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(IconLinks.OPENED_EYE_ICON_LINK,
                    height: 16.0,
                    width: 16.0,
                    colorFilter:
                        ColorFilter.mode(Palette.textBlack50, BlendMode.srcIn)),
                const SizedBox(width: 9),
                Text(
                  announcement.viewCount != null
                      ? announcement.viewCount.toString()
                      : '0',
                  style: FontStyles.rubikP2(color: Palette.textBlack50),
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 12,
                  child: FloatingActionButton.small(
                      highlightElevation: 0,
                      hoverElevation: 0,
                      backgroundColor: Colors.transparent,
                      onPressed: () {
                        Share.share(
                            'https://portal.irkutskoil.ru/events/news/${announcement.id}/');
                      },
                      elevation: 0,
                      child: Icon(Icons.share,
                          size: 16, color: Palette.textBlack50)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
