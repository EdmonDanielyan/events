import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:intl/intl.dart';

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
                width: elementWidth,
                child: Column(children: [
                  Container(
                      height: SizeConfig(context, 130.0)
                          .getProportionateScreenHeight,
                      width: elementWidth,
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
                          width: elementWidth,
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
                                    fontSize: SizeConfig(context, 13.0)
                                        .getProportionateScreenHeight,
                                  )),
                              Container(
                                  margin: EdgeInsets.only(top: 8),
                                  child: Text(
                                    newsItem.title ?? '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: SizeConfig(context, 17.0)
                                          .getProportionateScreenHeight,
                                    ),
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
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      IconLinks.BARREL_SVG_LINK,
                                                      width: SizeConfig(
                                                              context, 12.0)
                                                          .getProportionateScreenHeight,
                                                      height: SizeConfig(
                                                              context, 15.0)
                                                          .getProportionateScreenHeight,
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
                                                                  .iconTheme
                                                                  .color,
                                                    ),
                                                    const SizedBox(width: 5.0),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 4),
                                                      child: Text(
                                                        newsItem.likeCount !=
                                                                null
                                                            ? newsItem.likeCount
                                                                .toString()
                                                            : '0',
                                                        style: TextStyle(
                                                          fontSize: SizeConfig(
                                                                  context, 14.0)
                                                              .getProportionateScreenHeight,
                                                          color: (newsItem.isLiked !=
                                                                      null &&
                                                                  newsItem
                                                                      .isLiked!)
                                                              ? Theme.of(
                                                                      context)
                                                                  .primaryColor
                                                              : Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .secondary,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 24),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                      IconLinks
                                                          .COMMENT_SVG_LINK,
                                                      width: SizeConfig(
                                                              context, 16.0)
                                                          .getProportionateScreenHeight,
                                                      height: SizeConfig(
                                                              context, 15.0)
                                                          .getProportionateScreenHeight,
                                                    ),
                                                    const SizedBox(width: 5.0),
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
                                                              fontSize: SizeConfig(
                                                                      context,
                                                                      14.0)
                                                                  .getProportionateScreenHeight,
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .secondary,
                                                            )))
                                                  ],
                                                ),
                                              ),
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
                                                        width: SizeConfig(
                                                                context, 14.0)
                                                            .getProportionateScreenHeight,
                                                      ),
                                                      Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 4),
                                                          child: Text(
                                                              newsItem.viewCount !=
                                                                      null
                                                                  ? newsItem
                                                                      .viewCount
                                                                      .toString()
                                                                  : '0',
                                                              style: TextStyle(
                                                                fontSize: SizeConfig(
                                                                        context,
                                                                        14.0)
                                                                    .getProportionateScreenHeight,
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
