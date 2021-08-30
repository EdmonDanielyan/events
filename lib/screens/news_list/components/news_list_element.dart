import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:intl/intl.dart';

class NewsListElement extends StatelessWidget {
  const NewsListElement({Key? key, required this.newsItem}) : super(key: key);

  final NewsItemData newsItem;
  static const String DEFAULT_PREVIEW_PICTURE_LINK =
      'https://ysia.ru/wp-content/uploads/2019/04/225353843_5b787050a10e5.jpg';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
            context,
            '/news_detail',
            arguments: {'id': newsItem.id}
        );
      },
      child: Container(
          width: size.width,
          margin: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(
                      color: Color(0xffe5e5e5)
                  )
              )
          ),
          child: Column(
              children: [
                Container(
                    height: 191,
                    width: size.width,
                    child: Image.network(
                        newsItem.previewPictureLink
                            ?? DEFAULT_PREVIEW_PICTURE_LINK,
                        fit: BoxFit.fitWidth,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.network(
                            DEFAULT_PREVIEW_PICTURE_LINK,
                            fit: BoxFit.fitWidth,
                          );
                        }
                    )
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                    child: Column(
                      children: [
                        Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              newsItem.dateCreate != null
                                  ? DateFormat('dd.MM.yyyy')
                                    .format(newsItem.dateCreate!)
                                  : '',
                              style: TextStyle(
                                  color: Theme.of(context).iconTheme.color
                              ),
                              textAlign: TextAlign.start,
                            )
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 8),
                            alignment: Alignment.topLeft,
                            child: Text(
                              newsItem.title ?? '',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 4,
                              textAlign: TextAlign.start,
                            )
                        ),
                        Container(
                            alignment: Alignment.bottomCenter,
                            margin: EdgeInsets.only(top: 24),
                            child: Row(
                                children: [
                                  Container(
                                      child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                IconLinks.BARREL_SVG_LINK,
                                                width: 14,
                                                height: 16,
                                                color:
                                                  (newsItem.isLiked != null
                                                    && newsItem.isLiked!)
                                                      ? Theme.of(context)
                                                        .primaryColor
                                                      : Theme.of(context).iconTheme.color
                                            ),
                                            Container(
                                                margin: EdgeInsets.only(
                                                    left: 4
                                                ),
                                                child: Text(
                                                    newsItem.likeCount != null
                                                        ? newsItem.likeCount
                                                          .toString()
                                                        : '0',
                                                    style: TextStyle(
                                                      color: (
                                                        newsItem.isLiked != null
                                                          && newsItem.isLiked!)
                                                          ? Theme.of(context)
                                                            .primaryColor
                                                          : Theme.of(context).iconTheme.color,
                                                    )
                                                )
                                            )
                                          ]
                                      )
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 24),
                                      child: Row(
                                          children: [
                                            SvgPicture.asset(
                                                IconLinks.COMMENT_SVG_LINK,
                                                width: 18,
                                                height: 16
                                            ),
                                            Container(
                                                margin: EdgeInsets.only(
                                                    left: 4
                                                ),
                                                child: Text(
                                                    newsItem
                                                        .commentCount != null
                                                          ? newsItem
                                                            .commentCount
                                                            .toString()
                                                          : '0',
                                                    style: TextStyle(
                                                      color: Theme.of(context).iconTheme.color,
                                                    )
                                                )
                                            )
                                          ]
                                      )
                                  ),
                                  Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                          MainAxisAlignment.end,
                                        children: [
                                          Row(
                                              children: [
                                                SvgPicture.asset(
                                                    IconLinks.VIEW_COUNT_SVG_LINK,
                                                    width: 16
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 4
                                                    ),
                                                    child: Text(
                                                        newsItem
                                                          .viewCount != null
                                                            ? newsItem
                                                              .viewCount
                                                              .toString()
                                                            : '0',
                                                        style: TextStyle(
                                                          color:
                                                          Theme.of(context).iconTheme.color,
                                                        )
                                                    )
                                                )
                                              ]
                                          )
                                        ]
                                      )
                                  )
                                ]
                            )
                        )
                      ],
                    )
                )
              ]
          )
      )
    );
  }
}
