import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/list_element_divider.dart';
import 'package:ink_mobile/cubit/main_page/announcements_list_cubit.dart';
import 'package:ink_mobile/cubit/main_page/announcements_list_state.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:ink_mobile/screens/main/components/announcements_list_element.dart';
import 'package:ink_mobile/screens/main/components/announcements_list_element_placeholder.dart';

import '../main_screen.dart';

class AnnouncementsList extends StatelessWidget {
  const AnnouncementsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final announcementsCubit =
        MainScreen.of(context).mainAnnouncementsListCubit;
    return BlocBuilder<MainAnnouncementsListCubit, AnnouncementsListState>(
      bloc: announcementsCubit,
      builder: (context, state) {
        switch (state.type) {
          case AnnouncementsListStateType.LOADED:
            {
              List<AnnouncementData> items = state.data!;
              return Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ListView.separated(
                  shrinkWrap: true,
                  controller: ScrollController(keepScrollOffset: false),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) =>
                      AnnouncementsListElement(announcement: items[index]),
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      height: 40,
                      thickness: 1.0,
                      color: Color(0xffe5e5e5),
                    );
                  },
                ),
              );
            }

          case AnnouncementsListStateType.LOADING:
            {
              announcementsCubit.fetchAnnouncements();
              return Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ListView.separated(
                  shrinkWrap: true,
                  controller: ScrollController(keepScrollOffset: false),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) =>
                      const AnnouncementsListElementPlaceholder(),
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      height: 40,
                      thickness: 1.0,
                      color: Color(0xffe5e5e5),
                    );
                  },
                ),
              );

              // Padding(
              //   padding: EdgeInsets.only(top: 30),
              //   child: Column(children: [
              //     AnnouncementsListElementPlaceholder(),
              //     ListElementDivider(),
              //     AnnouncementsListElementPlaceholder(),
              //     ListElementDivider(),
              //     AnnouncementsListElementPlaceholder(),
              //     ListElementDivider(),
              //     AnnouncementsListElementPlaceholder(),
              //     ListElementDivider(),
              //     AnnouncementsListElementPlaceholder(),
              //   ]),
              // );
            }

          case AnnouncementsListStateType.ERROR:
            {
              MainScreen.of(context).mainPageCubit.emitErrorState();
              return Container();
            }
        }
      },
    );
  }
}
// class AnnouncementsList extends StatelessWidget {
//   const AnnouncementsList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final announcementsCubit =
//         MainScreen.of(context).mainAnnouncementsListCubit;
//     return BlocBuilder<MainAnnouncementsListCubit, AnnouncementsListState>(
//       bloc: announcementsCubit,
//       builder: (context, state) {
//         switch (state.type) {
//           case AnnouncementsListStateType.LOADED:
//             {
//               List<Widget> items = getAnnouncementsWidgetList(state.data!);
//               return Padding(
//                 padding: const EdgeInsets.only(top: 30),
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   controller: ScrollController(keepScrollOffset: false),
//                   itemCount: items.length,
//                   itemBuilder: (BuildContext context, int index) =>
//                       items[index],
//                 ),
//               );
//             }

//           case AnnouncementsListStateType.LOADING:
//             {
//               announcementsCubit.fetchAnnouncements();
//               return const Padding(
//                 padding: EdgeInsets.only(top: 30),
//                 child: Column(children: [
//                   AnnouncementsListElementPlaceholder(),
//                   ListElementDivider(),
//                   AnnouncementsListElementPlaceholder(),
//                   ListElementDivider(),
//                   AnnouncementsListElementPlaceholder(),
//                   ListElementDivider(),
//                   AnnouncementsListElementPlaceholder(),
//                   ListElementDivider(),
//                   AnnouncementsListElementPlaceholder(),
//                 ]),
//               );
//             }

//           case AnnouncementsListStateType.ERROR:
//             {
//               MainScreen.of(context).mainPageCubit.emitErrorState();
//               return Container();
//             }
//         }
//       },
//     );
//   }

//   List<Widget> getAnnouncementsWidgetList(
//       List<AnnouncementData> announcements) {
//     List<Widget> announcementsWidgetList = [];

//     for (var element in announcements) {
//       announcementsWidgetList.addAll([
//         AnnouncementsListElement(announcement: element),
//         const ListElementDivider()
//       ]);
//     }

//     announcementsWidgetList.removeLast();

//     return announcementsWidgetList;
//   }
// }
