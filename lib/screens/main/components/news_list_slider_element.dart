import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';

import '../../../messenger/functions/size_config.dart';

class NewsListSliderElement extends StatelessWidget {
  static const String DEFAULT_PREVIEW_PICTURE_LINK =
      'assets/images/default_news.jpg';

  final NewsItemData newsItem;

  const NewsListSliderElement({Key? key, required this.newsItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final elementWidth = MediaQuery.of(context).size.width * 0.73;
    final elementHeight =
        SizeConfig(context, 300.0).getProportionateScreenHeight;

    return Container(
      width: elementWidth,
      height: elementHeight,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.15),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(10, 10))
        ],
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/news_detail',
              arguments: {'id': newsItem.id});
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: SizeConfig(context, 130.0).getProportionateScreenHeight,
              width: elementWidth,
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
            const SizedBox(height: 18),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newsItem.dateCreate != null
                          ? DateFormat('dd.MM.yyyy')
                              .format(newsItem.dateCreate!)
                          : '',
                      style: FontStyles.rubikP2(color: Palette.textBlack50),
                    ),
                    const SizedBox(height: 8),
                    Text(newsItem.title ?? '',
                        style: FontStyles.rubikH4(color: Palette.textBlack),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis),
                    Flexible(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
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
                                style: FontStyles.rubikP2(
                                    color: Palette.textBlack50)),
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
                              style: FontStyles.rubikP2(
                                  color: Palette.textBlack50),
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
                              style: FontStyles.rubikP2(
                                  color: Palette.textBlack50),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
