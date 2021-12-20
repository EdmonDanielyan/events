import 'package:flutter/material.dart';
import 'package:ink_mobile/components/page_indicator/custom_page_indicator.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:ink_mobile/screens/main/components/news_list_slider_element.dart';

class NewsListSlider extends StatelessWidget {
  final _controllerOne = PageController(viewportFraction: 0.8, keepPage: true);
  final List<NewsItemData> newsList;

  static const double elementWidth = 276.0;
  static const double marginBetweenElements = 30.0;

  NewsListSlider({Key? key, required this.newsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 390,
      child: Column(
        children: [
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
              child: Row(
                children: getNewsList(),
              ),
            ),
          ),
          Expanded(child: getSlider(size))
        ],
      ),
    );
  }

  Widget getSlider(Size size) {
    if (newsList.length < 2) {
      return Container();
    }

    return Container(
      margin: EdgeInsets.only(top: 30),
      child: CustomPageIndicator(
        controller: _controllerOne,
        count: newsList.length,
      ),
    );
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
