import 'package:flutter/material.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/components/layout_builder/layout_builder.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/cubit/events_list/events_list_cubit.dart';
import 'package:ink_mobile/cubit/learning_materials_list/learning_materials_list_cubit.dart';
import 'package:ink_mobile/cubit/news_list/news_list_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/open_university/components/body.dart';
import 'package:ink_mobile/screens/open_university/cubit/open_university_cubit.dart';

class OpenUniversityScreen extends StatelessWidget {
  final EventsListCubit eventsListCubit;
  final LearningMaterialsListCubit learningMaterialsListCubit;
  final NewsListCubit newsListCubit;
  final OpenUniversityCubit openUniversityCubit;
  const OpenUniversityScreen({
    Key? key,
    required this.eventsListCubit,
    required this.learningMaterialsListCubit,
    required this.newsListCubit,
    required this.openUniversityCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;
    return Scaffold(
      appBar: InkAppBarWithText(context, title: _strings.openUniversity),
      body: CustomLayoutBuilder(
      builder: (context, constraints, isTablet) {
          return Body(
            isTablet: isTablet,
            learningMaterialsListCubit: learningMaterialsListCubit,
            eventsListCubit: eventsListCubit,
            newsListCubit: newsListCubit,
            openUniversityCubit: openUniversityCubit,
          );
        }
      ),
      bottomNavigationBar: const NewBottomNavBar(),
    );
  }
}
