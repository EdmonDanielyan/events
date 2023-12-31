import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/aseets.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

class NewsListElement extends StatelessWidget {
  const NewsListElement({Key? key, required this.newsItem}) : super(key: key);

  final NewsItemData newsItem;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/news_detail',
            arguments: {'id': newsItem.id});
      },
      child: ColoredBox(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: SizeConfig(context, 191.0).getProportionateScreenHeight,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: newsItem.previewPictureLink == null
                  ? Image.asset(DEFAULT_PREVIEW_PICTURE_LINK,
                      fit: BoxFit.fitWidth)
                  : Image.network(
                      newsItem.previewPictureLink!,
                      fit: BoxFit.fitWidth,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(DEFAULT_PREVIEW_PICTURE_LINK,
                            fit: BoxFit.fitWidth);
                      },
                    ),
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  newsItem.dateCreate != null
                      ? DateFormat('dd.MM.yyyy').format(newsItem.dateCreate!)
                      : '',
                  style: FontStyles.rubikP2(color: Palette.textBlack50),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 8),
                Text(
                  newsItem.title ?? '',
                  style: FontStyles.rubikH4(color: Palette.textBlack),
                  maxLines: 4,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(IconLinks.BARREL_SVG_LINK,
                        width: 16.0,
                        height: 16.0,
                        colorFilter: ColorFilter.mode(
                            Palette.textBlack50, BlendMode.srcIn)),
                    const SizedBox(width: 9),
                    Text(
                        newsItem.likeCount != null
                            ? newsItem.likeCount.toString()
                            : '0',
                        style: FontStyles.rubikP2(color: Palette.textBlack50)),
                    const SizedBox(width: 24),
                    SvgPicture.asset(IconLinks.COMMENT_ICON_LINK,
                        width: 16.0,
                        height: 16.0,
                        colorFilter: ColorFilter.mode(
                            Palette.textBlack50, BlendMode.srcIn)),
                    const SizedBox(width: 9),
                    Text(
                      newsItem.commentCount != null
                          ? newsItem.commentCount.toString()
                          : '0',
                      style: FontStyles.rubikP2(color: Palette.textBlack50),
                    ),
                    const SizedBox(width: 16),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.transparent,
                      child: FloatingActionButton.small(
                          highlightElevation: 0,
                          hoverElevation: 0,
                          backgroundColor: Colors.transparent,
                          onPressed: () {
                            Share.share(
                                'https://portal.irkutskoil.ru/events/news/${newsItem.id}/');
                          },
                          elevation: 0,
                          child: Icon(Icons.share,
                              size: 16, color: Palette.textBlack50)),
                    ),
                    const Spacer(),
                    SvgPicture.asset(IconLinks.OPENED_EYE_ICON_LINK,
                        width: 16.0,
                        height: 16.0,
                        colorFilter: ColorFilter.mode(
                            Palette.textBlack50, BlendMode.srcIn)),
                    const SizedBox(width: 4),
                    Text(
                      newsItem.viewCount != null
                          ? newsItem.viewCount.toString()
                          : '0',
                      style: FontStyles.rubikP2(color: Palette.textBlack50),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Divider(color: Palette.text20Grey),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
