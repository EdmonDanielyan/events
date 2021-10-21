import 'package:flutter/material.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/cubit/news_detail/news_detail_cubit.dart';
import 'package:ink_mobile/screens/news_detail/components/body.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsDetailCubit newsDetailCubit;
  const NewsDetailScreen({Key? key, required this.newsDetailCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(newsDetailCubit: newsDetailCubit),
      bottomNavigationBar: NewBottomNavBar(),
    );
  }
}
