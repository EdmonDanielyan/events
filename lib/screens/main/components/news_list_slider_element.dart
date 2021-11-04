import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:intl/intl.dart';

class NewsListSliderElement extends StatelessWidget {
  static const double ELEMENT_WIDTH = 276.0;
  static const double ELEMENT_HEIGHT = 334.0;
  static const String DEFAULT_PREVIEW_PICTURE_LINK =
      'assets/images/default_news.jpg';

  final NewsItemData newsItem;

  const NewsListSliderElement({Key? key, required this.newsItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ELEMENT_WIDTH,
        height: ELEMENT_HEIGHT,
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(10, 10))
              ],
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/news_detail',
                  arguments: {'id': newsItem.id});
            },
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                clipBehavior: Clip.hardEdge,
                width: ELEMENT_WIDTH,
                child: Column(children: [
                  Container(
                      height: 141,
                      width: ELEMENT_WIDTH,
                      child: newsItem.previewPictureLink == null
                          ? Image.asset(DEFAULT_PREVIEW_PICTURE_LINK,
                              fit: BoxFit.fitWidth)
                          : Image.network(newsItem.previewPictureLink!,
                              fit: BoxFit.fitWidth,
                              errorBuilder: (context, error, stackTrace) {
                              return Image.asset(DEFAULT_PREVIEW_PICTURE_LINK,
                                  fit: BoxFit.fitWidth);
                            })),
                  Expanded(
                      child: Container(
                          margin: EdgeInsets.only(top: 18.0),
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          width: ELEMENT_WIDTH,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  newsItem.dateCreate != null
                                      ? DateFormat('dd.MM.yyyy')
                                          .format(newsItem.dateCreate!)
                                      : '',
                                  style: TextStyle(
                                    color: Theme.of(context).iconTheme.color,
                                  )),
                              Container(
                                  margin: EdgeInsets.only(top: 8),
                                  child: Text(
                                    newsItem.title ?? '',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                              Expanded(
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                    Container(
                                        alignment: Alignment.bottomCenter,
                                        margin: EdgeInsets.only(bottom: 20),
                                        child: Row(children: [
                                          Container(
                                              child: Row(children: [
                                            SvgPicture.asset(
                                                IconLinks.BARREL_SVG_LINK,
                                                width: 14,
                                                height: 16,
                                                color:
                                                    (newsItem.isLiked != null &&
                                                            newsItem.isLiked!)
                                                        ? Theme.of(context)
                                                            .primaryColor
                                                        : Theme.of(context)
                                                            .iconTheme
                                                            .color),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 4),
                                                child: Text(
                                                    newsItem.likeCount != null
                                                        ? newsItem.likeCount
                                                            .toString()
                                                        : '0',
                                                    style: TextStyle(
                                                      color:
                                                          (newsItem.isLiked !=
                                                                      null &&
                                                                  newsItem
                                                                      .isLiked!)
                                                              ? Theme.of(
                                                                      context)
                                                                  .primaryColor
                                                              : Theme.of(
                                                                      context)
                                                                  .accentColor,
                                                    )))
                                          ])),
                                          Container(
                                              margin: EdgeInsets.only(left: 24),
                                              child: Row(children: [
                                                SvgPicture.asset(
                                                    IconLinks.COMMENT_SVG_LINK,
                                                    width: 18,
                                                    height: 16),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 4),
                                                    child: Text(
                                                        newsItem.commentCount !=
                                                                null
                                                            ? newsItem
                                                                .commentCount
                                                                .toString()
                                                            : '0',
                                                        style: TextStyle(
                                                          color:
                                                              Theme.of(context)
                                                                  .accentColor,
                                                        )))
                                              ])),
                                          Expanded(
                                              child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                Row(children: [
                                                  SvgPicture.asset(
                                                      IconLinks
                                                          .VIEW_COUNT_SVG_LINK,
                                                      width: 16),
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          left: 4),
                                                      child: Text(
                                                          newsItem.viewCount !=
                                                                  null
                                                              ? newsItem
                                                                  .viewCount
                                                                  .toString()
                                                              : '0',
                                                          style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .iconTheme
                                                                .color,
                                                          )))
                                                ])
                                              ]))
                                        ]))
                                  ]))
                            ],
                          )))
                ])),
          ),
        ));
  }
}
