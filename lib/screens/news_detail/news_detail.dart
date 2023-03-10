import 'package:flutter/material.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/cubit/main_page/news_block_cubit.dart';
import 'package:ink_mobile/cubit/news_detail/news_detail_cubit.dart';
import 'package:ink_mobile/cubit/news_list/news_list_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/news_detail/components/body.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsDetailCubit newsDetailCubit;
  final NewsBlockCubit newsBlockCubit;
  final NewsListCubit newsListCubit;
  const NewsDetailScreen(
      {Key? key,
      required this.newsDetailCubit,
      required this.newsBlockCubit,
      required this.newsListCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InkAppBar(
        context,
        showPersonalPageLink: true,
        title: localizationInstance.news,
      ),
      body: Body(
        newsDetailCubit: newsDetailCubit,
        newsBlockCubit: newsBlockCubit,
        newsListCubit: newsListCubit,
      ),
      backgroundColor: Palette.white,
      bottomNavigationBar: const NewBottomNavBar(),
    );
  }
}
