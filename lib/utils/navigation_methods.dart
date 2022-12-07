import 'package:flutter/material.dart';
import 'package:ink_mobile/setup.dart';

import '../components/new_bottom_nav_bar/cubit/new_bottom_nav_bar_cubit.dart';

// TODO: replace these methods to functions/navigation_utils?
class NavigationMethods {
  static void backToMainScreen(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      final mainScreenKey = "/app_layer";
      Navigator.of(context)
          .popUntil((route) => route.settings.name == mainScreenKey);
    }
    getIt<NewBottomNavBarCubit>().goToPage(NavBarItems.home);
  }

  static void openNewsList(BuildContext context, {dynamic arguments}) {
    backToMainScreen(context);
    final newsListKey = "/news_list";
    Navigator.of(context).pushNamed(newsListKey, arguments: arguments);
  }

  static void openNewsDetail(BuildContext context, int articleID) {
    openNewsList(context);
    final newsArticleKey = "/news_detail";
    Navigator.of(context).pushNamed(newsArticleKey,
        arguments: {"id": articleID});
  }

  static void openEventsList(BuildContext context, {dynamic arguments}) {
    backToMainScreen(context);
    final eventsListKey = "/events_list";
    Navigator.of(context).pushNamed(eventsListKey, arguments: arguments);
  }

  static void openEventDetail(BuildContext context, int eventID) {
    openEventsList(context);
    final eventDetailKey = "/event_detail";
    Navigator.of(context).pushNamed(eventDetailKey,
        arguments: {"id": eventID});
  }

  static void openAnnouncementsList(BuildContext context, {dynamic arguments}) {
    backToMainScreen(context);
    final announcementsListKey = "/announcements_list";
    Navigator.of(context).pushNamed(announcementsListKey, arguments: arguments);
  }

  static void openAnnouncementDetail(BuildContext context, int announcementID) {
    openAnnouncementsList(context);
    final announcementDetailKey = "/announcement_detail";
    Navigator.of(context).pushNamed(announcementDetailKey,
        arguments: {"id": announcementID});
  }
}
