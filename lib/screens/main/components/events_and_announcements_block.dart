import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/constants/font_styles.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/cubit/main_page/events_and_announcements_block_cubit.dart';
import 'package:ink_mobile/cubit/main_page/events_and_announcements_block_state.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/functions/size_config.dart';
import 'package:ink_mobile/screens/main/components/announcements_list.dart';
import 'package:ink_mobile/screens/main/components/events_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ink_mobile/components/buttons/default_button.dart';

import '../main_screen.dart';

class EventsAndAnnouncementsBlock extends StatelessWidget {
  static late EventsAndAnnouncementsBlockCubit cubit;
  static late Size? size;
  const EventsAndAnnouncementsBlock({Key? key}) : super(key: key);
  static late AppLocalizations _strings;

  @override
  Widget build(BuildContext context) {
    _strings = localizationInstance;
    size = MediaQuery.of(context).size;

    cubit = MainScreen.of(context).eventsAndAnnouncementsBlockCubit;

    return BlocBuilder<EventsAndAnnouncementsBlockCubit,
        EventsAndAnnouncementsBlockState>(
      bloc: cubit,
      builder: (context, state) {
        switch (state.type) {
          case EventsAndAnnouncementsBlockStateType.EVENTS:
            {
              return Padding(
                padding: const EdgeInsets.only(top: 25),
                child: DecoratedBox(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 20.0),
                    child: Column(
                      children: [
                        getNavigationRow(context, 'events'),
                        const EventsList(),
                        const SizedBox(height: 15.0),
                        DefaultButton(
                          title: _strings.allEvents,
                          onTap: () {
                            Navigator.pushNamed(context, '/events_list');
                          },
                          buttonColor: Palette.transparent,
                          borderColor: Palette.greenE4A,
                          textColor: Palette.greenE4A,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }

          case EventsAndAnnouncementsBlockStateType.ANNOUNCEMENTS:
            {
              return Padding(
                padding: const EdgeInsets.only(top: 25),
                child: DecoratedBox(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 20.0),
                    child: Column(
                      children: [
                        getNavigationRow(context, 'announcements'),
                        const AnnouncementsList(),
                        const SizedBox(height: 15),
                        DefaultButton(
                          title: _strings.allAnnouncements,
                          onTap: () {
                            Navigator.pushNamed(context, '/announcements_list');
                          },
                          buttonColor: Palette.transparent,
                          borderColor: Palette.greenE4A,
                          textColor: Palette.greenE4A,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
        }
      },
    );
  }

  Widget getNavigationRow(BuildContext context, String checked) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      height: SizeConfig(context, 34).getProportionateScreenHeight,
      child: Row(
        children: getNavRowItemList(context: context, checkedItem: checked),
      ),
    );
  }

  List<NavRowButton> getNavRowButtons() {
    return [
      NavRowButton(
          title: _strings.events,
          code: 'events',
          onPressed: cubit.setEventsState),
      NavRowButton(
          title: _strings.announcements,
          code: 'announcements',
          onPressed: cubit.setAnnouncementsState),
    ];
  }

  List<Widget> getNavRowItemList(
      {required BuildContext context, String checkedItem = 'events'}) {
    List<Widget> navRowItemList = [];

    getNavRowButtons().forEach((element) {
      if (checkedItem == element.code) {
        navRowItemList.add(
          Container(
            padding: const EdgeInsets.only(right: 30),
            child: getNavRowItem(
                context: context,
                title: element.title,
                onTap: element.onPressed,
                checked: true),
          ),
        );
      } else {
        navRowItemList.add(
          Container(
            padding: const EdgeInsets.only(right: 30),
            child: getNavRowItem(
              context: context,
              title: element.title,
              onTap: element.onPressed,
            ),
          ),
        );
      }
    });

    return navRowItemList;
  }

  Widget getNavRowItem(
      {required BuildContext context,
      required String title,
      required void Function()? onTap,
      bool checked = false}) {
    return Container(
      alignment: Alignment.topLeft,
      child: InkWell(
        onTap: checked ? null : onTap,
        child: Text(
          title,
          style: FontStyles.rubikH2(
            color: checked ? Palette.greenE4A : Palette.textBlack,
          ),
        ),
      ),
    );
  }
}

class NavRowButton {
  final String title;
  final String code;
  final void Function()? onPressed;

  NavRowButton(
      {required this.title, required this.code, required this.onPressed});
}
