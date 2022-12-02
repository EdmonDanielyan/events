import 'package:flutter/material.dart';

mixin NavigationMixin {
  void backToMainScreen(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      final mainScreenKey = "/app_layer";
      Navigator.of(context)
          .popUntil((route) => route.settings.name == mainScreenKey);
    }
  }

  void openNewsList(BuildContext context, {dynamic arguments}) {
    backToMainScreen(context);
    final newsListKey = "/news_list";
    Navigator.of(context).pushNamed(newsListKey, arguments: arguments);
  }

  void openNewsArticle(BuildContext context, int articleID) {
    openNewsList(context);
    final newsArticleKey = "/news_detail";
    Navigator.of(context).pushNamed(newsArticleKey,
        arguments: {"id": articleID});
  }

  void openEventsList(BuildContext context, {dynamic arguments}) {
    backToMainScreen(context);
    final eventsListKey = "/events_list";
    Navigator.of(context).pushNamed(eventsListKey, arguments: arguments);
  }

  void openEventDetail(BuildContext context, int eventID) {
    openEventsList(context);
    final eventDetailKey = "/event_detail";
    Navigator.of(context).pushNamed(eventDetailKey,
        arguments: {"id": eventID});
  }

  void openAnnouncementsList(BuildContext context, {dynamic arguments}) {
    backToMainScreen(context);
    final announcementsListKey = "/announcements_list";
    Navigator.of(context).pushNamed(announcementsListKey, arguments: arguments);
  }

  void openAnnouncementDetail(BuildContext context, int announcementID) {
    openAnnouncementsList(context);
    final announcementDetailKey = "/announcement_detail";
    Navigator.of(context).pushNamed(announcementDetailKey,
        arguments: {"id": announcementID});
  }
}
