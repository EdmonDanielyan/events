import 'package:flutter/material.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar.dart';
import 'package:ink_mobile/cubit/main_page/announcements_list_cubit.dart';
import 'package:ink_mobile/cubit/main_page/events_and_announcements_block_cubit.dart';
import 'package:ink_mobile/cubit/main_page/events_list_cubit.dart';
import 'package:ink_mobile/cubit/main_page/main_cubit.dart';
import 'package:ink_mobile/cubit/main_page/news_block_cubit.dart';
import 'package:ink_mobile/screens/main/components/body.dart';

class MainScreen extends StatefulWidget {
  static MainScreenState of(BuildContext context) =>
      context.findAncestorStateOfType<MainScreenState>()!;

  final MainAnnouncementsListCubit mainAnnouncementsListCubit;
  final EventsAndAnnouncementsBlockCubit eventsAndAnnouncementsBlockCubit;
  final MainEventsListCubit mainEventsListCubit;
  final MainPageCubit mainPageCubit;
  final NewsBlockCubit newsBlockCubit;

  const MainScreen({
    Key? key,
    required this.mainAnnouncementsListCubit,
    required this.eventsAndAnnouncementsBlockCubit,
    required this.mainEventsListCubit,
    required this.mainPageCubit,
    required this.newsBlockCubit,
  }) : super(key: key);

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen>
    with AutomaticKeepAliveClientMixin {
  MainAnnouncementsListCubit get mainAnnouncementsListCubit =>
      widget.mainAnnouncementsListCubit;
  EventsAndAnnouncementsBlockCubit get eventsAndAnnouncementsBlockCubit =>
      widget.eventsAndAnnouncementsBlockCubit;
  MainEventsListCubit get mainEventsListCubit => widget.mainEventsListCubit;
  MainPageCubit get mainPageCubit => widget.mainPageCubit;
  NewsBlockCubit get newsBlockCubit => widget.newsBlockCubit;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: InkAppBar(showPersonalPageLink: true),
      body: Body(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
