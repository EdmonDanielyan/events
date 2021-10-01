import 'package:flutter/material.dart';
import 'package:ink_mobile/components/menu_sheet/menu_sheet.dart';
import 'package:ink_mobile/functions/navigation_utils.dart';
import 'package:ink_mobile/screens/main/main_screen.dart';
import 'package:ink_mobile/screens/search/search_screen.dart';
import 'package:ink_mobile/screens/service_list/service_list_screen.dart';
import 'package:ink_mobile/screens/test/test_screen.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

abstract class NavBottomNavBarItem {
  abstract String icon;
  abstract String label;
  abstract Widget screen;
  void onTap(BuildContext context, Function(int) onChanged, int index);
}

class MainBottomNavBarItem extends NavBottomNavBarItem {
  String icon = 'assets/images/home.svg';
  String label = "Главная";
  Widget screen = MainScreen();

  void onTap(BuildContext context, Function onChanged, int index) {
    NavigationUtils.popScreenIfCan(context);
    onChanged(index);
  }
}

class SearchBottomNavBarItem extends NavBottomNavBarItem {
  String icon = 'assets/images/search.svg';
  String label = "Поиск";
  Widget screen = SearchScreen();

  void onTap(BuildContext context, Function onChanged, int index) {
    NavigationUtils.popScreenIfCan(context);
    onChanged(index);
  }
}

class MessagesBottomNavBarItem extends NavBottomNavBarItem {
  String icon = 'assets/images/message.svg';
  String label = "Сообщения";
  Widget screen = TestScreen();

  void onTap(BuildContext context, Function onChanged, int index) {
    NavigationUtils.popScreenIfCan(context);
    onChanged(index);
  }
}

class ServicesBottomNavBarItem extends NavBottomNavBarItem {
  String icon = 'assets/images/services.svg';
  String label = "Сервисы";
  Widget screen = ServiceListScreen();

  void onTap(BuildContext context, Function onChanged, int index) {
    NavigationUtils.popScreenIfCan(context);
    onChanged(index);
  }
}

class MenuBottomNavBarItem extends NavBottomNavBarItem {
  String icon = 'assets/images/menu.svg';
  String label = "Меню";
  Widget screen = SizedBox();

  void onTap(BuildContext context, Function onChanged, int index) {
    showMaterialModalBottomSheet(
      backgroundColor: Color(0xfff9f9f9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      context: context,
      builder: (context) {
        return MenuSheet();
      },
    );
  }
}
