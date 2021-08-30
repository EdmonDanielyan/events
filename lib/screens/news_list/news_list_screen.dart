import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/components/bottom_nav_bars/ink_bottom_navigation_bar.dart';
import 'package:ink_mobile/cubit/news_list/news_list_cubit.dart';
import 'package:ink_mobile/screens/news_list/components/body.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({Key? key}) : super(key: key);
  static const String APP_BAR_TITLE = 'Новости';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsListCubit>(
        create: (BuildContext context) => NewsListCubit(),
        child: Scaffold(
          appBar: InkAppBarWithText(title: APP_BAR_TITLE),
          body: Body(),
          bottomNavigationBar: InkBottomNavBar(selectedItemCode: InkBottomNavBarItemCodes.main),
        )
    );
  }
}
