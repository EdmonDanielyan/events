import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/list_element_divider.dart';
import 'package:ink_mobile/cubit/main_page/announcements_list_cubit.dart';
import 'package:ink_mobile/cubit/main_page/announcements_list_state.dart';
import 'package:ink_mobile/cubit/main_page/main_cubit.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:ink_mobile/screens/main/components/announcements_list_element.dart';
import 'package:ink_mobile/screens/main/components/announcements_list_element_placeholder.dart';
import 'package:ink_mobile/setup.dart';

class AnnouncementsList extends StatelessWidget {
  const AnnouncementsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainAnnouncementsListCubit>(
        create: (BuildContext context) => sl.get<MainAnnouncementsListCubit>(),
        child: BlocBuilder<MainAnnouncementsListCubit, AnnouncementsListState>(
            builder: (context, state) {
          final MainAnnouncementsListCubit announcementsCubit =
              BlocProvider.of<MainAnnouncementsListCubit>(context);

          switch (state.type) {
            case AnnouncementsListStateType.LOADED:
              {
                List<Widget> items = getAnnouncementsWidgetList(state.data!);
                return Container(
                  margin: EdgeInsets.only(top: 30),
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: ScrollController(keepScrollOffset: false),
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) =>
                        items[index],
                  ),
                );
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
