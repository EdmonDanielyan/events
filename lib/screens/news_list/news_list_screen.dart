import 'package:flutter/material.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/cubit/news_list/news_list_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/news_list/components/body.dart';

class NewsListScreen extends StatelessWidget {
  final NewsListCubit newsListCubit;
  const NewsListScreen({Key? key, required this.newsListCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    return Scaffold(
      appBar: InkAppBarWithText(context, title: _strings.news),
      body: Body(cubit: newsListCubit),
      bottomNavigationBar: NewBottomNavBar(showActive: false),
    );
  }
}
