import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:shimmer/shimmer.dart';

class NewsListSliderElementPlaceholder extends StatelessWidget {
  static const double ELEMENT_WIDTH = 276.0;
  static const double ELEMENT_HEIGHT = 334.0;
  static const String DEFAULT_PREVIEW_PICTURE_LINK =
      'assets/images/default_news.jpg';

  const NewsListSliderElementPlaceholder({
    Key? key,
  }) : super(key: key);

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
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              clipBehavior: Clip.hardEdge,
              width: ELEMENT_WIDTH,
              child: Column(children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.5),
                  highlightColor: Colors.grey.withOpacity(0.2),
                  child: Container(
                      height: 141, width: ELEMENT_WIDTH, color: Colors.black),
                ),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(top: 18.0),
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        width: ELEMENT_WIDTH,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.withOpacity(0.5),
                              highlightColor: Colors.grey.withOpacity(0.2),
                              child: Container(
                                width: 100,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8),
                              child: Shimmer.fromColors(
                                baseColor: Colors.grey.withOpacity(0.5),
                                highlightColor: Colors.grey.withOpacity(0.2),
                                child: Container(
                                  width: 400,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ),
                            ),
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
                                              color: Theme.of(context)
                                                  .iconTheme
                                                  .color),
                                          Container(
                                            margin: EdgeInsets.only(left: 4),
                                            child: Shimmer.fromColors(
                                              baseColor:
                                                  Colors.grey.withOpacity(0.5),
                                              highlightColor:
                                                  Colors.grey.withOpacity(0.2),
                                              child: Container(
                                                width: 30,
                                                height: 15,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                              ),
                                            ),
                                          )
                                        ])),
                                        Container(
                                            margin: EdgeInsets.only(left: 24),
                                            child: Row(children: [
                                              SvgPicture.asset(
                                                  IconLinks.COMMENT_SVG_LINK,
                                                  width: 18,
                                                  height: 16),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 4),
                                                child: Shimmer.fromColors(
                                                  baseColor: Colors.grey
                                                      .withOpacity(0.5),
                                                  highlightColor: Colors.grey
                                                      .withOpacity(0.2),
                                                  child: Container(
                                                    width: 30,
                                                    height: 15,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                  ),
                                                ),
                                              )
                                            ])),
                                        Expanded(
                                            child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                              Row(children: [
                                                SvgPicture.asset(
                                                    IconLinks
                                                        .VIEW_COUNT_SVG_LINK,
                                                    width: 16),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 4),
                                                  child: Shimmer.fromColors(
                                                    baseColor: Colors.grey
                                                        .withOpacity(0.5),
                                                    highlightColor: Colors.grey
                                                        .withOpacity(0.2),
                                                    child: Container(
                                                      width: 30,
                                                      height: 15,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                    ),
                                                  ),
                                                )
                                              ])
                                            ]))
                                      ]))
                                ]))
                          ],
                        )))
              ])),
        ));
  }
}
