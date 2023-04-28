import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/constants/aseets.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:intl/intl.dart';

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
      child: Container(
        width: size.width,
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
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
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      newsItem.dateCreate != null
                          ? DateFormat('dd.MM.yyyy')
                              .format(newsItem.dateCreate!)
                          : '',
                      style: FontStyles.rubikP2(color: Palette.textBlack50),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    alignment: Alignment.topLeft,
                    child: Text(
                      newsItem.title ?? '',
                      style: FontStyles.rubikH4(color: Palette.textBlack),
                      maxLines: 4,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                IconLinks.BARREL_SVG_LINK,
                                width: 16.0,
                                height: 16.0,
                                color: (newsItem.isLiked != null &&
                                        newsItem.isLiked!)
                                    ? Palette.greenE4A
                                    : Palette.textBlack50,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 4),
                                child: Text(
                                  newsItem.likeCount != null
                                      ? newsItem.likeCount.toString()
                                      : '0',
                                  style: FontStyles.rubikP2(
                                    color: (newsItem.isLiked != null &&
                                            newsItem.isLiked!)
                                        ? Palette.greenE4A
                                        : Palette.textBlack50,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 24),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                IconLinks.COMMENT_ICON_LINK,
                                width: 16.0,
                                height: 16.0,
                                color: Palette.textBlack50,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 4),
                                child: Text(
                                  newsItem.commentCount != null
                                      ? newsItem.commentCount.toString()
                                      : '0',
                                  style: FontStyles.rubikP2(
                                      color: Palette.textBlack50),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    IconLinks.OPENED_EYE_ICON_LINK,
                                    width: 16.0,
                                    height: 16.0,
                                    color: Palette.textBlack50,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 4),
                                    child: Text(
                                      newsItem.viewCount != null
                                          ? newsItem.viewCount.toString()
                                          : '0',
                                      style: FontStyles.rubikP2(
                                        color: Palette.textBlack50,
                                      ),
                                    ),
                                  ),
                                ],
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
            Divider(color: Palette.text20Grey),
          ],
        ),
      ),
    );
  }
}
