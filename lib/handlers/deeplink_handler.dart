import 'package:flutter/cupertino.dart';
import 'package:ink_mobile/constants/urls.dart';
import 'package:ink_mobile/utils/navigation_methods.dart';
import 'package:logging/logging.dart';

class DeepLinkHandler {
  static BuildContext? currentContext;
  static final logger = new Logger('DEEPLINK-NAV');

  static void catchLink(String url, BuildContext context) {
    if (context != null) {
      currentContext = context;
      navigateToScreen(url);
    } else {}
  }

  static void navigateToScreen(String url) {
    List<String> pathParts =
        url.replaceFirst(UrlsConfig.defaultUrl, "").split("/");
    switch (pathParts[0]) {
      case "news":
        if (pathParts.length == 1) {
          NavigationMethods.openNewsList(currentContext!);
        } else {
          NavigationMethods.openNewsDetail(
            currentContext!,
            int.parse(pathParts[1]),
          );
        }
        break;
      case "events":
        if (pathParts.length == 1) {
          NavigationMethods.openEventsList(currentContext!);
        } else {
          NavigationMethods.openEventDetail(
            currentContext!,
            int.parse(pathParts[1]),
          );
        }
        break;

      case "announcements":
        if (pathParts.length == 1) {
          NavigationMethods.openAnnouncementsList(currentContext!);
        } else {
          NavigationMethods.openAnnouncementDetail(
            currentContext!,
            int.parse(pathParts[1]),
          );
        }
        break;
      case "chat_with":
        NavigationMethods.openChatByUserID(
          currentContext!,
          int.parse(pathParts[1]),
        );
        break;
      case "notifications":
        NavigationMethods.openNotificationChat(currentContext!);
        break;
      case "chat":
        if (pathParts.length == 1) {
          logger.finest('TODO: Open meddenger');
          // TODO: открыть мессенждер
        } else {
          NavigationMethods.openChatByID(
            currentContext!,
            int.parse(pathParts[1]),
          );
          logger.finest('TODO:  Open chat ' + pathParts[1]);
        }
        break;
      default:
        break;
    }
  }
}
