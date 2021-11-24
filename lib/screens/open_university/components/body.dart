import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/events_list/events_list_cubit.dart';
import 'package:ink_mobile/cubit/learning_materials_list/learning_materials_list_cubit.dart';
import 'package:ink_mobile/cubit/news_list/news_list_cubit.dart';
import 'package:ink_mobile/screens/open_university/components/about_project.dart';
import 'package:ink_mobile/screens/open_university/components/events_list.dart';
import 'package:ink_mobile/screens/open_university/components/learning_materials_list.dart';
import 'package:ink_mobile/screens/open_university/components/literacy_list.dart';
import 'package:ink_mobile/screens/open_university/components/open_university_filter_slider.dart';
import 'package:ink_mobile/screens/open_university/cubit/open_university_cubit.dart';
import 'package:ink_mobile/screens/open_university/cubit/open_university_state.dart';

class Body extends StatelessWidget {
  final EventsListCubit eventsListCubit;
  final LearningMaterialsListCubit learningMaterialsListCubit;
  final NewsListCubit newsListCubit;
  final OpenUniversityCubit openUniversityCubit;
  Body({
    Key? key,
    required this.eventsListCubit,
    required this.learningMaterialsListCubit,
    required this.newsListCubit,
    required this.openUniversityCubit,
  }) : super(key: key);
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
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
                selectedFilter: OpenUniversityFilterCodes.about_project,
                openUniversityCubit: openUniversityCubit,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24),
              child: BlocBuilder<OpenUniversityCubit, OpenUniversityState>(
                  bloc: openUniversityCubit,
                  builder: (context, state) {
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
                          return OpenUniversityEventsList(
                            cubit: eventsListCubit,
                            controller: _scrollController,
                          );
                        }

                      case OpenUniversityStateType.INK_LITERACY:
                        {
                          return OpenUniversityLiteracyList(
                            controller: _scrollController,
                            cubit: newsListCubit,
                          );
                        }

                      case OpenUniversityStateType.LEARNING_MATERIALS:
                        {
                          return LearningMaterialsList(
                            cubit: learningMaterialsListCubit,
                            controller: _scrollController,
                          );
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
