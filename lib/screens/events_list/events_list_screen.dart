import 'package:flutter/material.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/cubit/events_list/events_list_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/events_list/components/body.dart';

class EventsListScreen extends StatelessWidget {
  final EventsListCubit eventsListCubit;
  const EventsListScreen({Key? key, required this.eventsListCubit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;

    return Scaffold(
      appBar: InkAppBarWithText(title: _strings.events),
      body: Body(cubit: eventsListCubit),
      bottomNavigationBar: NewBottomNavBar(),
    );
  }
}
