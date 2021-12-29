import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/functions/new_bottom_nav_bar_items.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/nav_bar_indicator.dart';

class NewBottomNavBarMixin {
  List<NavBottomNavBarItem> navBottomNavBarItems = [
    MainBottomNavBarItem(),
    SearchBottomNavBarItem(),
    MessagesBottomNavBarItem(),
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

  BottomNavigationBarItem _buildNewBottomNavItem(NavBottomNavBarItem item) {
    return BottomNavigationBarItem(
      icon: Stack(
        children: [
          Container(
            height: 25,
            child: SvgPicture.asset(
              item.icon,
            ),
          ),
          item.indicator != null
              ? NavBarIndicator(indicatorCubit: item.indicator!)
              : SizedBox()
        ],
      ),
      activeIcon: Stack(
        children: [
          Container(
            height: 25,
            child: SvgPicture.asset(item.icon, color: Color(0xff12512a)),
          ),
          item.indicator != null
              ? NavBarIndicator(indicatorCubit: item.indicator!)
              : SizedBox()
        ],
      ),
      label: item.label,
    );
  }
}
