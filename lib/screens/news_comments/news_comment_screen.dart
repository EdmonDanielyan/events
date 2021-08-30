import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/cubit/news_comments/news_comments_cubit.dart';
import 'package:ink_mobile/screens/news_comments/components/body.dart';
import 'package:ink_mobile/screens/news_comments/components/comment_intput.dart';
import 'package:main_api_client/api.dart';

class NewsCommentScreen extends StatelessWidget {
  NewsCommentScreen({Key? key}) : super(key: key);
  static const String APP_BAR_TITLE = 'Комментарии';

  @override
  Widget build(BuildContext context) {

    return BlocProvider<NewsCommentsCubit>(
        create: (BuildContext context) =>
            NewsCommentsCubit(api: MainApiClient()),
        child: Scaffold(
          appBar: InkAppBarWithText(
              title: APP_BAR_TITLE
          ),
          body: Body(),
          bottomSheet: NewsCommentInput(),
        )
      );
    }
}
