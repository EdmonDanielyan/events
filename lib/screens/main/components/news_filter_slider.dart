import 'package:flutter/material.dart';
import 'package:ink_mobile/components/filter_slider_element.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewsFilterSlider extends StatelessWidget {
  const NewsFilterSlider({Key? key}) : super(key: key);

  static late AppLocalizations _strings;

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    return Container(
      height: 30,
      margin: EdgeInsets.only(top: 8.0),
      child: Container(
        child: getFilterListView(context),
      ),
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
                Navigator.pushNamed(context, '/open_university');
              } else {
                Navigator.pushNamed(context, '/news_list',
                    arguments: {'filter': items[index].code});
              }
            },
            isSelected: items[index].code == 'news',
            selectedColor: Colors.white,
            selectedTextStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ));
        },
        separatorBuilder: (context, index) {
          return Container(margin: EdgeInsets.only(right: 10.0));
        },
        itemCount: items.length);
  }

  List<FilterItem> _getFilterItems() {
    return [
      FilterItem(title: _strings.allNews, code: 'news'),
      FilterItem(
          title: '# ${_strings.sustainableDevelopment}',
          code: 'stable_development'),
      FilterItem(title: '# ${_strings.volunteerNews}', code: 'volunteer_news'),
      FilterItem(title: '# ${_strings.sportNews}', code: 'information_sport'),
      FilterItem(title: '# ${_strings.msNews}', code: 'information_ms'),
      FilterItem(title: "# ${_strings.newsIdea}", code: 'news-idea'),
      FilterItem(title: '# ${_strings.openUniversity}', code: 'open_university')
    ];
  }
}

class FilterItem {
  final String title;
  final String code;

  const FilterItem({required this.title, required this.code});
}
