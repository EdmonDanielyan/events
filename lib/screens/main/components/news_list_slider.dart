import 'package:flutter/material.dart';
import 'package:ink_mobile/components/page_indicator/custom_page_indicator.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:ink_mobile/screens/main/components/news_list_slider_element.dart';

import '../../../messenger/functions/size_config.dart';

// //TODO: добавить проверку если список пустой или в блоке избавиться от ! оператора
class NewsListSlider extends StatelessWidget {
  final _controllerOne = PageController(viewportFraction: 0.8, keepPage: true);
  final List<NewsItemData> newsList;

  NewsListSlider({Key? key, required this.newsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig(context, 350.0).getProportionateScreenHeight,
      child: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: SizeConfig(context, 290.0).getProportionateScreenHeight,
            child: ListView.builder(
              itemCount: newsList.length,
              controller: _controllerOne,
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: NewsListSliderElement(newsItem: newsList[index]),
                );
              },
            ),
          ),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(top: 30, right: 20),
                  child: newsList.length > 2
                      ? CustomPageIndicator(
                          controller: _controllerOne,
                          count: newsList.length,
                        )
                      : const SizedBox.shrink()))
        ],
      ),
    );
  }
}
