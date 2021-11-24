import 'package:flutter/material.dart';
import 'package:ink_mobile/components/static_slider/static_slider_effect.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:ink_mobile/screens/main/components/news_list_slider_element.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NewsListSlider extends StatelessWidget {
  final PageController _controllerOne = PageController();
  final List<NewsItemData> newsList;

  static const double elementWidth = 276.0;
  static const double marginBetweenElements = 30.0;

  NewsListSlider({Key? key, required this.newsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: 390,
        child: Column(children: [
          Container(
              width: size.width,
              height: 334,
              alignment: AlignmentDirectional.topStart,
              margin: EdgeInsets.only(top: 20.0),
              clipBehavior: Clip.none,
              child: SingleChildScrollView(
                  controller: _controllerOne,
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Row(children: getNewsList()))),
          Expanded(child: getSlider(size))
        ]));
  }

  Widget getSlider(Size size) {
    if (newsList.length < 2) {
      return Container();
    }

    return Container(
        margin: EdgeInsets.only(top: 30),
        child: SmoothPageIndicator(
          controller: _controllerOne,
          count: newsList.length,
          axisDirection: Axis.horizontal,
          effect: StaticSliderEffect(
              activeDotColor: Color(0xff2c4155),
              rowWidth: getRowWidth(),
              dotWidth: size.width * 0.6),
        ));
  }

  double getRowWidth() {
    return ((elementWidth + marginBetweenElements) * newsList.length) -
        marginBetweenElements;
  }

  List<Widget> getNewsList() {
    List<Widget> newsWidgetList = [];

    if (newsList.length > 0) {
      for (int i = 0; i < newsList.length - 1; i++) {
        NewsItemData curNewsItem = newsList[i];
        newsWidgetList.add(Container(
            margin: EdgeInsets.only(right: marginBetweenElements),
            child: NewsListSliderElement(newsItem: curNewsItem)));
      }

      NewsItemData curNewsItem = newsList.last;

      newsWidgetList
          .add(Container(child: NewsListSliderElement(newsItem: curNewsItem)));
    }

    return newsWidgetList;
  }
}
