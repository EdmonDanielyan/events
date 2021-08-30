import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/components/buttons/elevated_full_width_button.dart';
import 'package:ink_mobile/cubit/main_page/events_and_announcements_block_cubit.dart';
import 'package:ink_mobile/cubit/main_page/events_and_announcements_block_state.dart';
import 'package:ink_mobile/screens/main/components/announcements_list.dart';
import 'package:ink_mobile/screens/main/components/events_list.dart';

class EventsAndAnnouncementsBlock extends StatelessWidget {
  late EventsAndAnnouncementsBlockCubit cubit;
  Size? size;
  EventsAndAnnouncementsBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return BlocProvider<EventsAndAnnouncementsBlockCubit>(
        create: (BuildContext context) => EventsAndAnnouncementsBlockCubit(),
        child: BlocBuilder<EventsAndAnnouncementsBlockCubit, EventsAndAnnouncementsBlockState>(
            builder: (context, state) {
              cubit = BlocProvider.of<EventsAndAnnouncementsBlockCubit>(context);

              switch (state.type) {
                case EventsAndAnnouncementsBlockStateType.EVENTS: {
                  return Container(
                      margin: EdgeInsets.only(top: 25, bottom: 40),
                      padding: EdgeInsets.symmetric(vertical: 30.0),
                      decoration: BoxDecoration(
                          color: Colors.white
                      ),
                      child: Column(
                          children: [
                            getNavigationRow(
                                context,
                                'events'
                            ),
                            EventsList(),
                            ElevatedFullWidthButton(
                                title: 'Все события',
                                link: '/events_list'
                            )
                          ]
                      )
                  );
                }

                case EventsAndAnnouncementsBlockStateType.ANNOUNCEMENTS: {
                  return Container(
                      margin: EdgeInsets.only(
                          top: 25,
                          bottom: 40
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 30.0
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white
                      ),
                      child: Column(
                          children: [
                            getNavigationRow(
                                context,
                                'announcements'
                            ),
                            AnnouncementsList(),
                            ElevatedFullWidthButton(
                                title: 'Все объявления',
                                link: '/announcements_list'
                            )
                          ]
                      )
                  );
                }
              }
            }
        )
    );
  }

  Widget getNavigationRow(
      BuildContext context,
      String checked
  ) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 36,
        child: Row(
          children: getNavRowItemList(
              context: context,
              checkedItem: checked
          )
        )
    );
  }

  List<NavRowButton> getNavRowButtons() {
    return [
      NavRowButton(
          title: 'События',
          code: 'events',
          onPressed: cubit.setEventsState
      ),
      NavRowButton(
          title: 'Объявления',
          code: 'announcements',
          onPressed: cubit.setAnnouncementsState
      ),
    ];
  }

  List<Widget> getNavRowItemList({
    required BuildContext context,
    String checkedItem = 'events'
  }) {
    List<Widget> navRowItemList = [];

    getNavRowButtons().forEach((element) {
      if (checkedItem == element.code) {
        navRowItemList.add(
          Container(
            padding: EdgeInsets.only(right: 30),
            child: getNavRowItem(
                context: context,
                title: element.title,
                onPressed: element.onPressed,
                checked: true
            ),
          )
        );
      } else {
        navRowItemList.add(
            Container(
              padding: EdgeInsets.only(right: 30),
              child: getNavRowItem(
                  context: context,
                  title: element.title,
                  onPressed: element.onPressed,
              ),
            )
        );
      }
    });

    return navRowItemList;
  }

  Widget getNavRowItem({
    required BuildContext context,
    required String title,
    required void Function()? onPressed,
    bool checked = false
  }) {
    FontWeight fontWeight = FontWeight.w400;
    Color color = Theme.of(context).accentColor;

    if (checked) {
      fontWeight = FontWeight.bold;
      color = Colors.black;
      onPressed = null;
    }

    return Container(
      alignment: Alignment.topLeft,
        child: TextButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
            ),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.07,
                  fontWeight: fontWeight,
                  color: color
              ),
            ),
            onPressed: onPressed
        )
    );

  }
}

class NavRowButton {
  final String title;
  final String code;
  final void Function()? onPressed;

  NavRowButton({
    required this.title,
    required this.code,
    required this.onPressed
  });
}