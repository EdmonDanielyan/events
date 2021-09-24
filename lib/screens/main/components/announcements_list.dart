import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/buttons/error_refresh_button.dart';
import 'package:ink_mobile/components/list_element_divider.dart';
import 'package:ink_mobile/cubit/main_page/announcements_list_cubit.dart';
import 'package:ink_mobile/cubit/main_page/announcements_list_state.dart';
import 'package:ink_mobile/cubit/main_page/main_cubit.dart';
import 'package:ink_mobile/localization/localization_cubit/localization_cubit.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:ink_mobile/screens/main/components/announcements_list_element.dart';
import 'package:ink_mobile/screens/main/components/announcements_list_element_placeholder.dart';

class AnnouncementsList extends StatelessWidget {
  const AnnouncementsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _strings =
        BlocProvider.of<LocalizationCubit>(context, listen: true).state;
    return BlocProvider<AnnouncementsListCubit>(
        create: (BuildContext context) =>
            AnnouncementsListCubit(languageStrings: _strings),
        child: BlocBuilder<AnnouncementsListCubit, AnnouncementsListState>(
            builder: (context, state) {
          final AnnouncementsListCubit announcementsCubit =
              BlocProvider.of<AnnouncementsListCubit>(context);

          switch (state.type) {
            case AnnouncementsListStateType.LOADED:
              {
                return Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Column(
                        children: getAnnouncementsWidgetList(state.data!)));
              }

            case AnnouncementsListStateType.LOADING:
              {
                announcementsCubit.fetchAnnouncements();
                return Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Column(children: [
                      AnnouncementsListElementPlaceholder(),
                      ListElementDivider(),
                      AnnouncementsListElementPlaceholder(),
                      ListElementDivider(),
                      AnnouncementsListElementPlaceholder(),
                      ListElementDivider(),
                      AnnouncementsListElementPlaceholder(),
                      ListElementDivider(),
                      AnnouncementsListElementPlaceholder(),
                    ]));
              }

            case AnnouncementsListStateType.ERROR:
              {
                final MainPageCubit mainPageCubit =
                    BlocProvider.of<MainPageCubit>(context);
                mainPageCubit.emitErrorState();

                return Container();
              }
          }
        }));
  }

  List<Widget> getAnnouncementsWidgetList(
      List<AnnouncementData> announcements) {
    List<Widget> announcementsWidgetList = [];

    announcements.forEach((element) {
      announcementsWidgetList.addAll([
        AnnouncementsListElement(announcement: element),
        ListElementDivider()
      ]);
    });

    announcementsWidgetList.removeLast();

    return announcementsWidgetList;
  }
}
