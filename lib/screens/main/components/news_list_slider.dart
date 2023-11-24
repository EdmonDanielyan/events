import 'package:flutter/material.dart';
import 'package:ink_mobile/components/page_indicator/custom_page_indicator.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:ink_mobile/screens/main/components/news_list_slider_element.dart';

import '../../../messenger/functions/size_config.dart';

class NewsListSlider extends StatelessWidget {
  final _controllerOne = PageController(viewportFraction: 0.8, keepPage: true);
  final List<NewsItemData> newsList;

  static const double marginBetweenElements = 30.0;

  NewsListSlider({Key? key, required this.newsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: SizeConfig(context, 350.0).getProportionateScreenHeight,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: SizeConfig(context, 290.0).getProportionateScreenHeight,
            alignment: AlignmentDirectional.topStart,
            margin: const EdgeInsets.only(top: 20.0),
            clipBehavior: Clip.none,
            child: SingleChildScrollView(
              controller: _controllerOne,
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
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
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: CustomPageIndicator(
        controller: _controllerOne,
        count: newsList.length,
      ),
    );
  }

  List<Widget> getNewsList() {
    List<Widget> newsWidgetList = [];

    if (newsList.isNotEmpty) {
      for (int i = 0; i < newsList.length - 1; i++) {
        NewsItemData curNewsItem = newsList[i];
        newsWidgetList.add(
          Padding(
            padding: const EdgeInsets.only(right: marginBetweenElements),
            child: NewsListSliderElement(newsItem: curNewsItem),
          ),
        );
      }

      NewsItemData curNewsItem = newsList.last;

      newsWidgetList.add(NewsListSliderElement(newsItem: curNewsItem));
    }

    return newsWidgetList;
  }
}
