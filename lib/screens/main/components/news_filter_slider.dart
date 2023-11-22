import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/filter_slider_element.dart';
import 'package:ink_mobile/cubit/main_page/news_block_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../cubit/main_page/news_block_state.dart';
import '../../../messenger/functions/size_config.dart';
import '../../../models/filter_item.dart';
import '../main_screen.dart';

class NewsFilterSlider extends StatelessWidget {
  const NewsFilterSlider({Key? key}) : super(key: key);

  static late AppLocalizations _strings;
  static late NewsBlockCubit newsCubit;

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    newsCubit = MainScreen.of(context).newsBlockCubit;
    return BlocBuilder<NewsBlockCubit, NewsBlockState>(
        bloc: newsCubit,
        builder: (context, state) {
          return Container(
            height: SizeConfig(context, 28.0).getProportionateScreenHeight,
            margin: const EdgeInsets.only(top: 8.0),
            child: getFilterListView(state.tabs ?? _getFilterItems()),
          );
        });
  }

  ListView getFilterListView(List<FilterItem> items) {
    final filterItems = items.toList();
    filterItems.removeWhere(((tab) => tab.code == 'main'));
    return ListView.separated(
        addAutomaticKeepAlives: false,
        physics: const AlwaysScrollableScrollPhysics(),
        addRepaintBoundaries: false,
        addSemanticIndexes: false,
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return FilterSliderElement(
            title: filterItems[index].title,
            onTap: () {
              if (filterItems[index].code == 'open_university') {
                Navigator.pushNamed(context, '/open_university');
              } else {
                Navigator.pushNamed(context, '/news_list',
                    arguments: {'filter': filterItems[index].code});
              }
            },
            isSelected: filterItems[index].code == 'news',
            selectedColor: Colors.white,
            selectedTextStyle: TextStyle(
              fontSize: SizeConfig(context, 15.0).getProportionateScreenHeight,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Container(margin: const EdgeInsets.only(right: 10.0));
        },
        itemCount: filterItems.length);
  }

  List<FilterItem> _getFilterItems() {
    return <FilterItem>[
      // FilterItem(title: _strings.allNews, code: 'main'),
      FilterItem(title: _strings.allNews, code: 'news'),
      FilterItem(
          title: _strings.sustainableDevelopment, code: 'stable_development'),
      FilterItem(title: _strings.safety, code: 'safety'),
      FilterItem(title: _strings.it, code: 'it'),
      FilterItem(title: _strings.volunteerNews, code: 'volunteer_news'),
      FilterItem(title: _strings.sportNews, code: 'information_sport'),
      FilterItem(title: _strings.newsIdea, code: 'news-idea'),
      // FilterItem(title: '# ${_strings.openUniversity}', code: 'open_university')
    ];
  }
}
