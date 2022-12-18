import 'package:flutter/cupertino.dart';
import 'package:ink_mobile/constants/urls.dart';
import 'package:ink_mobile/utils/navigation_methods.dart';
import 'package:logging/logging.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class PushTapHandler {
  static BuildContext? currentContext;
  static bool isSubscribed = false;
  static final logger = new Logger('PUSH-NAV');

  static void subscribe() {
    OneSignal.shared.setNotificationOpenedHandler((notification) {
      if (currentContext != null && notification.notification.launchUrl?.isNotEmpty == true) {
        navigateToScreen(notification.notification.launchUrl!);
      }
    });
    isSubscribed = true;
  }

  static void navigateToScreen(String url) {
    List<String> pathParts =
        url.replaceFirst(UrlsConfig.pushBaseUrl, "").split("/");
    switch (pathParts[0]) {
      case "news":
        if (pathParts.length == 1) {
          NavigationMethods.openNewsList(currentContext!);
        } else {
          NavigationMethods.openNewsDetail(currentContext!, int.parse(pathParts[1]));
        }
        break;
      case "events":
        if (pathParts.length == 1) {
          NavigationMethods.openEventsList(currentContext!);
        } else {
          NavigationMethods.openEventDetail(currentContext!, int.parse(pathParts[1]));
        }
        break;

      case "announcements":
        if (pathParts.length == 1) {
          NavigationMethods.openAnnouncementsList(currentContext!);
        } else {
          NavigationMethods.openAnnouncementDetail(currentContext!, int.parse(pathParts[1]));
        }
        break;

      case "chat_with":
        if (pathParts.length == 2) {
          logger.finest('TODO: Open private chat with '+pathParts[1]);
          // TODO: открыть приватный чат по ID собеседника
        }
        break;
      case "chat":
        if (pathParts.length == 1) {
          logger.finest('TODO: Open meddenger');
          // TODO: открыть мессенждер
        } else {
          logger.finest('TODO:  Open chat '+pathParts[1]);
        }
        break;
      case "notifications":
        logger.finest('TODO: Open notifications channel');
        // TODO: открыть чат с уведомлениями
        break;

      default:
        break;
    }
  }
}
