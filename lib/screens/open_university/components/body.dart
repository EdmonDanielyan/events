import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/events_list/events_list_cubit.dart';
import 'package:ink_mobile/cubit/learning_materials_list/learning_materials_list_cubit.dart';
import 'package:ink_mobile/cubit/news_list/news_list_cubit.dart';
import 'package:ink_mobile/cubit/open_university/open_university_cubit.dart';
import 'package:ink_mobile/cubit/open_university/open_university_state.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/screens/open_university/components/about_project.dart';
import 'package:ink_mobile/screens/open_university/components/events_list.dart';
import 'package:ink_mobile/screens/open_university/components/learning_materials_list.dart';
import 'package:ink_mobile/screens/open_university/components/literacy_list.dart';
import 'package:ink_mobile/screens/open_university/components/open_university_filter_slider.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    return SingleChildScrollView(
      controller: _scrollController,
      clipBehavior: Clip.none,
      child: Container(
        margin: EdgeInsets.only(top: 24),
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: OpenUniversityFilterSlider(
                    selectedFilter: OpenUniversityFilterCodes.about_project)),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: BlocBuilder<OpenUniversityCubit, OpenUniversityState>(
                  builder: (context, state) {
                OpenUniversityCubit cubit =
                    BlocProvider.of<OpenUniversityCubit>(context);

                switch (state.type) {
                  case OpenUniversityStateType.ERROR:
                    {
                      return Center(
                        child: Text('ERROR'),
                      );
                    }

                  case OpenUniversityStateType.ABOUT_PROJECT:
                    {
                      return AboutProject();
                    }

                  case OpenUniversityStateType.EVENTS:
                    {
                      return BlocProvider<EventsListCubit>(
                          create: (BuildContext context) =>
                              EventsListCubit(languageStrings: _strings),
                          child: OpenUniversityEventsList(
                              controller: _scrollController));
                    }

                  case OpenUniversityStateType.INK_LITERACY:
                    {
                      return BlocProvider<NewsListCubit>(
                          create: (BuildContext context) =>
                              NewsListCubit(languageStrings: _strings),
                          child: OpenUniversityLiteracyList(
                              controller: _scrollController));
                    }

                  case OpenUniversityStateType.LEARNING_MATERIALS:
                    {
                      return BlocProvider<LearningMaterialsListCubit>(
                          create: (BuildContext context) =>
                              LearningMaterialsListCubit(
                                  languageStrings: _strings),
                          child: LearningMaterialsList(
                              controller: _scrollController));
                    }
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
