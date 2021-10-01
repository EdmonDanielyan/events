import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/functions/new_bottom_nav_bar_items.dart';

class NewBottomNavBarMixin {
  static List<NavBottomNavBarItem> navBottomNavBarItems = [
    MainBottomNavBarItem(),
    SearchBottomNavBarItem(),
    //MessagesBottomNavBarItem(),
    ServicesBottomNavBarItem(),
    MenuBottomNavBarItem()
  ];

  List<Widget> getScreens() {
    List<Widget> items = [];
    navBottomNavBarItems.forEach((element) => items.add(element.screen));

    return items;
  }

  List<BottomNavigationBarItem> getItems() {
    List<BottomNavigationBarItem> items = [];
    navBottomNavBarItems
        .forEach((element) => items.add(_buildNewBottomNavItem(element)));

    return items;
  }

  static BottomNavigationBarItem _buildNewBottomNavItem(
      NavBottomNavBarItem item) {
    return BottomNavigationBarItem(
      icon: Container(
        height: 25,
        child: SvgPicture.asset(
          item.icon,
        ),
      ),
      activeIcon: Container(
        height: 25,
        child: SvgPicture.asset(item.icon, color: Color(0xff12512a)),
      ),
      label: item.label,
    );
  }
}
