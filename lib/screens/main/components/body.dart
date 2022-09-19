import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/cubit/main_page/announcements_list_cubit.dart';
import 'package:ink_mobile/cubit/main_page/events_list_cubit.dart';
import 'package:ink_mobile/cubit/main_page/main_cubit.dart';
import 'package:ink_mobile/cubit/main_page/main_state.dart';
import 'package:ink_mobile/cubit/main_page/news_block_cubit.dart';
import 'package:ink_mobile/screens/main/components/background.dart';
import 'package:ink_mobile/screens/main/components/events_and_announcements_block.dart';
import 'package:ink_mobile/screens/main/components/news_block.dart';

import '../main_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainPageCubit mainPageCubit = MainScreen.of(context).mainPageCubit;
    final NewsBlockCubit newsBlockCubit = MainScreen.of(context).newsBlockCubit;
    final MainAnnouncementsListCubit mainAnnouncementsListCubit =
        MainScreen.of(context).mainAnnouncementsListCubit;
    final MainEventsListCubit mainEventsListCubit =
        MainScreen.of(context).mainEventsListCubit;

    return RefreshIndicator(
      onRefresh: () async {
        mainPageCubit.refresh();
      },
      color: Colors.green,
      displacement: 20,
      child: BlocBuilder<MainPageCubit, MainPageState>(
        bloc: mainPageCubit,
        builder: (context, state) {
          switch (state.type) {
            case (MainPageStateType.LOADED):
              {
                return getLoadedStateWidget();
              }

            case (MainPageStateType.LOADING):
              {
                mainPageCubit.load();
                newsBlockCubit.refresh();
                mainAnnouncementsListCubit.refresh();
                mainEventsListCubit.refresh();
                return getLoadingStateWidget(context);
              }

            case (MainPageStateType.ERROR):
              {
                return ErrorRefreshButton(
                  onTap: mainPageCubit.refresh,
                  text: state.errorMessage,
                );
              }
          }
        },
      ),
    );
  }

  Widget getLoadedStateWidget() {
    return Background(
      child: Container(
        child: Column(
          children: [
            NewsBlock(),
            EventsAndAnnouncementsBlock(),
          ],
        ),
      ),
    );
  }

  Widget getLoadingStateWidget(BuildContext context) {
    return InkPageLoader();
  }
}
