import 'package:flutter/cupertino.dart';
import 'package:ink_mobile/constants/urls.dart';
import 'package:ink_mobile/utils/navigation_methods.dart';
import 'package:logging/logging.dart';

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
                    arguments: {'filter': 'information_ms'});
                break;
              } else {
                // Культура безопасности
                // Узнать путь для апишки, ошибка запроса information_ms, literacy
                NavigationMethods.openNewsList(currentContext!,
                    arguments: {'filter': 'literacy'});
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
        if (pathParts.length == 2) {
          NavigationMethods.openSearch(currentContext!);
          break;
        } else {
          if (pathParts.elementAt(2).length <= 16) {
            NavigationMethods.openSearch(currentContext!);
            break;
          } else {
            //Открыть поиск с введеным значением
            break;
          }
        }
      default:
        NavigationMethods.backToMainScreen(currentContext!);
        break;
    }
  }
}
