import 'package:flutter/material.dart';
import 'package:ink_mobile/components/app_bars/ink_app_bar.dart';
import 'package:ink_mobile/cubit/main_page/announcements_list_cubit.dart';
import 'package:ink_mobile/cubit/main_page/events_and_announcements_block_cubit.dart';
import 'package:ink_mobile/cubit/main_page/events_list_cubit.dart';
import 'package:ink_mobile/cubit/main_page/main_cubit.dart';
import 'package:ink_mobile/cubit/main_page/news_block_cubit.dart';
import 'package:ink_mobile/messenger/providers/messenger.dart';
import 'package:ink_mobile/models/jwt_payload.dart';
import 'package:ink_mobile/screens/main/components/body.dart';
import 'package:ink_mobile/setup.dart';
import 'package:ink_mobile/utils/app_config.dart';

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
  void initState() {
    super.initState();

    getIt<MessengerProvider>().init(
        getIt.get<AppConfig>().wsUrl,
        JwtPayload.myId,
        path: getIt.get<AppConfig>().wsPath,
        apiUrl: getIt.get<AppConfig>().messengerApiUrl
    );

  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: InkAppBar(
        context,
        leading: const SizedBox.shrink(),
        showPersonalPageLink: true,
      ),
      body: Body(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
