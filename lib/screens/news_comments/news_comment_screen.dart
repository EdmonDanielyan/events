import 'package:flutter/material.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/cubit/main_page/news_block_cubit.dart';
import 'package:ink_mobile/cubit/news_comments/news_comments_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/news_comments/components/body.dart';
import 'package:ink_mobile/screens/news_comments/components/comment_intput.dart';

class NewsCommentScreen extends StatelessWidget {
  final NewsCommentsCubit newsCommentsCubit;
  final NewsBlockCubit newsBlockCubit;
  NewsCommentScreen(
      {Key? key, required this.newsCommentsCubit, required this.newsBlockCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    return Scaffold(
      appBar: InkAppBarWithText(title: _strings.comments),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Body(newsCommentsCubit: newsCommentsCubit),
          ),
          NewsCommentInput(
            newsCommentsCubit: newsCommentsCubit,
            newsBlockCubit: newsBlockCubit,
          ),
        ],
      ),
    );
  }
}
