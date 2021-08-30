import 'package:flutter/material.dart';
import 'package:ink_mobile/components/filter_slider_element.dart';

class NewsFilterSlider extends StatelessWidget {
  const NewsFilterSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        margin: EdgeInsets.only(top: 8.0),
        child: Container(
          child: getFilterListView(context)
        )
    );
  }

  ListView getFilterListView(BuildContext context) {
    List<FilterItem> items = _getFilterItems();

    return ListView.separated(
      addAutomaticKeepAlives: false,
      physics: AlwaysScrollableScrollPhysics(),
      addRepaintBoundaries: false,
      addSemanticIndexes: false,
      clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
              child: FilterSliderElement(
                title: items[index].title,
                onTap: () {
                  if (items[index].code == 'open_university') {
                    Navigator.pushNamed(
                        context,
                        '/open_university'
                    );
                  } else {
                    Navigator.pushNamed(
                        context,
                        '/news_list',
                        arguments: {'filter': items[index].code}
                    );
                  }
                },
                isSelected: items[index].code == 'news',
                selectedColor: Colors.white,
                selectedTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              )
          );
        },
        separatorBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 10.0)
          );
        },
        itemCount: items.length
    );
  }

  List<FilterItem> _getFilterItems() {
    return [
      FilterItem(title: 'Все новости', code: 'news'),
      FilterItem(title: '# ИНК-Идея', code: 'news-idea'),
      FilterItem(title: '# Волонтерское движение', code: 'volunteer_news'),
      FilterItem(title: '# Спорт', code: 'information_sport'),
      FilterItem(title: '# Молодежный совет', code: 'information_ms'),
      FilterItem(title: '# Открытый университет', code: 'open_university')
    ];
  }
}

class FilterItem {
  final String title;
  final String code;

  const FilterItem({required this.title, required this.code});
}
