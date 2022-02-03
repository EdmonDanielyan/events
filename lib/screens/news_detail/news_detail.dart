import 'package:flutter/material.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/cubit/main_page/news_block_cubit.dart';
import 'package:ink_mobile/cubit/news_detail/news_detail_cubit.dart';
import 'package:ink_mobile/screens/news_detail/components/body.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsDetailCubit newsDetailCubit;
  final NewsBlockCubit newsBlockCubit;
  const NewsDetailScreen(
      {Key? key, required this.newsDetailCubit, required this.newsBlockCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        newsDetailCubit: newsDetailCubit,
        newsBlockCubit: newsBlockCubit,
      ),
      bottomNavigationBar: const NewBottomNavBar(),
    );
  }
}
