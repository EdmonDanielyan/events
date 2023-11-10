import 'package:flutter/cupertino.dart';
import 'package:ink_mobile/constants/urls.dart';
import 'package:ink_mobile/utils/navigation_methods.dart';
import 'package:logging/logging.dart';
import 'package:xxtea/xxtea.dart';

class DeepLinkHandler {
  static BuildContext? currentContext;
  static final logger = new Logger('DEEPLINK-NAV');

  static void catchLink(String url) {
    if (currentContext != null) {
      navigateToScreen(url);
    } else {}
  }

  static void navigateToScreen(String url) {
    List<String> pathParts =
        url.replaceFirst(UrlsConfig.defaultUrl, "").split("/");
    pathParts.removeWhere((item) => item == '');
    switch (pathParts.elementAt(0)) {
      case "events":
        if (pathParts.length == 1) {
          NavigationMethods.openEventsList(currentContext!);
          break;
        } else {
          if ((pathParts.length == 2 &&
              RegExp(r'^\d+$').hasMatch(pathParts.elementAt(1)))) {
            NavigationMethods.openEventDetail(
              currentContext!,
              int.parse(pathParts.elementAt(1)),
            );
            break;
          } else
            switch (pathParts.elementAt(1)) {
              TODO: // Добавить id объявления на беке
              case "ads":
                NavigationMethods.openAnnouncementsList(currentContext!);
                break;
              case "news":
                if (pathParts.length == 2) {
                  NavigationMethods.openNewsList(currentContext!);
                  break;
                } else {
                  NavigationMethods.openNewsDetail(
                    currentContext!,
                    int.parse(pathParts.elementAt(2)),
                  );
                  break;
                }
              case "reg":
                //События с регистрацией, пока заглушка(events/reg/...)
                NavigationMethods.openEventsList(currentContext!);
                break;

              // Разделы новстей

              // Устойчивое развитие
              case "development_ink":
                //Поиск новости по ID
                if (pathParts.length == 3) {
                  String id =
                      pathParts.elementAt(2).replaceAll('?ELEMENT_ID=', '');
                  NavigationMethods.openNewsDetail(
                    currentContext!,
                    int.parse(id),
                  );
                  break;
                } else {
                  NavigationMethods.openNewsList(currentContext!,
                      arguments: {'filter': 'stable_development'});
                  break;
                }
              case "heading":
                // Информационные технологии
                if (pathParts.elementAt(2) == "240922") {
                  // Узнать путь для апишки, ошибка запроса, information_ms, literacy
                  NavigationMethods.openNewsList(currentContext!,
                      arguments: {'filter': 'it'});
                  break;
                } else {
                  // Культура безопасности
                  NavigationMethods.openNewsList(currentContext!,
                      arguments: {'filter': 'safety'});
                  break;
                }
              case "news-idea":
                if (pathParts.length == 3) {
                  NavigationMethods.openNewsDetail(
                    currentContext!,
                    int.parse(pathParts.elementAt(2)),
                  );
                  break;
                } else {
                  NavigationMethods.openNewsList(currentContext!,
                      arguments: {'filter': 'news-idea'});
                  break;
                }
              default:
                NavigationMethods.backToMainScreen(currentContext!);
                break;
            }
        }
        break;
      // Волонтерское движеие
      case "volunteer":
        //Поиск новости по ID
        if (pathParts.length == 3) {
          NavigationMethods.openNewsDetail(
            currentContext!,
            int.parse(pathParts.elementAt(2)),
          );
          break;
        } else {
          NavigationMethods.openNewsList(currentContext!,
              arguments: {'filter': 'volunteer_news'});
          break;
        }
      // Спорт
      case "sport":
        //Поиск новости по ID
        if (pathParts.length == 3) {
          NavigationMethods.openNewsDetail(
            currentContext!,
            int.parse(pathParts.elementAt(2)),
          );
          break;
        } else {
          NavigationMethods.openNewsList(currentContext!,
              arguments: {'filter': 'information_sport'});
          break;
        }
      case "search":
        if (pathParts.length == 1) {
          NavigationMethods.openSearch(currentContext!);
          break;
        } else {
          if (pathParts.elementAt(1).length <= 16) {
            NavigationMethods.openSearch(currentContext!);
            break;
          } else {
            String encodeUrl(String encodedUrl) {
              Uri uri = Uri.parse(encodedUrl);
              String query = uri.query;

              var params = <String, String>{};
              query.split('&').forEach((param) {
                var p = param.split('=');
                params[p[0]] = Uri.decodeFull(p[1]);
              });

              return params['q'].toString();
            }

            String textForSearch = encodeUrl(pathParts.elementAt(1));

            NavigationMethods.openSearchWithMessage(currentContext!);
            break;
          }
        }
      case "personal":
        //Поиск новости по ID
        if (pathParts.length == 2) {
          String id = pathParts.elementAt(1).replaceAll('?USER_ID=', '');
          NavigationMethods.openUserPageById(
            currentContext!,
            int.parse(id),
          );
          break;
        } else {
          NavigationMethods.backToMainScreen(currentContext!);
          break;
        }
      case "chats":
        var numberRegExp = RegExp(r'^\d+$');

        if (!numberRegExp.hasMatch(pathParts.elementAt(2))) {
          String key = "n4{q]v&C";
          String? decryptData =
              xxtea.decryptToString(pathParts.elementAt(2), key);
          NavigationMethods.openChatInviteLink(
            currentContext!,
            int.parse(decryptData!),
          );
        } else {
          NavigationMethods.openChatInviteLink(
            currentContext!,
            int.parse(pathParts.elementAt(2)),
          );
        }

        break;
      case "announcements":
        NavigationMethods.openAnnouncementDetail(
          currentContext!,
          int.parse(pathParts.elementAt(1)),
        );
        break;
      default:
        NavigationMethods.backToMainScreen(currentContext!);
        break;
    }
  }
}
