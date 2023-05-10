import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:flutter/material.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar_with_text.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/new_bottom_nav_bar.dart';
import 'package:ink_mobile/constants/app_metrics_events.dart';
import 'package:ink_mobile/cubit/events_list/events_list_cubit.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/screens/events_list/components/body.dart';

class EventsListScreen extends StatefulWidget {
  final EventsListCubit eventsListCubit;
  const EventsListScreen({Key? key, required this.eventsListCubit})
      : super(key: key);

  @override
  State<EventsListScreen> createState() => _EventsListScreenState();
}

class _EventsListScreenState extends State<EventsListScreen> {
  @override
  void initState() {
    super.initState();
    AppMetricsEvents().eventsEvent();
  }
  @override
  Widget build(BuildContext context) {
    final _strings = localizationInstance;

    return Scaffold(
      appBar: InkAppBarWithText(context, title: _strings.events),
      body: Body(cubit: widget.eventsListCubit),
      bottomNavigationBar: NewBottomNavBar(showActive: false),
    );
  }
}
