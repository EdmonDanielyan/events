import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/ink_page_loader.dart';
import 'package:ink_mobile/cubit/main_page/main_cubit.dart';
import 'package:ink_mobile/cubit/main_page/main_state.dart';
import 'package:ink_mobile/screens/main/components/background.dart';
import 'package:ink_mobile/screens/main/components/events_and_announcements_block.dart';
import 'package:ink_mobile/screens/main/components/news_block.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainPageCubit mainPageCubit = BlocProvider.of<MainPageCubit>(context);

    return RefreshIndicator(
        onRefresh: () async {
          mainPageCubit.refresh();
        },
        color: Colors.green,
        displacement: 20,
        child: BlocBuilder<MainPageCubit, MainPageState>(
            builder: (context, state) {
          switch (state.type) {
            case (MainPageStateType.LOADED):
              {
                return getLoadedStateWidget();
              }

            case (MainPageStateType.LOADING):
              {
                mainPageCubit.load();
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

          return Container();
        }));
  }

  Widget getLoadedStateWidget() {
    return Background(
        child: Container(
      child: Column(
        children: [NewsBlock(), EventsAndAnnouncementsBlock()],
      ),
    ));
  }

  Widget getLoadingStateWidget(BuildContext context) {
    return InkPageLoader();
  }
}
