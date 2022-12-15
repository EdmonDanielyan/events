import 'package:flutter/cupertino.dart';
import 'package:ink_mobile/constants/urls.dart';
import 'package:ink_mobile/utils/navigation_methods.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class PushTapHandler {
  static BuildContext? currentContext;
  static bool isSubscribed = false;

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
      case "newEventNotification":
        NavigationMethods.openNotificationChat(currentContext!);
        break;
      default:
        break;
    }
  }
}
