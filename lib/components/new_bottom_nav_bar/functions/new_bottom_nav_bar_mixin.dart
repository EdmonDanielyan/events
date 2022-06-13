import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/functions/new_bottom_nav_bar_items.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/nav_bar_indicator.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/setup.dart';

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

  List<BottomNavigationBarItem> getItems({bool showActive = true}) {
    List<BottomNavigationBarItem> items = [];
    navBottomNavBarItems.forEach((element) {
      items.add(_buildNewBottomNavItem(element,
          showActive: showActive,
          msgIndicator: element is MessagesBottomNavBarItem ? true : false));
    });

    return items;
  }

  BottomNavigationBarItem _buildNewBottomNavItem(NavBottomNavBarItem item,
      {bool showActive = true, bool msgIndicator = false}) {
    return BottomNavigationBarItem(
      icon: Stack(
        children: [
          Container(
            height: 25,
            child: SvgPicture.asset(
              item.icon,
            ),
          ),
          if (msgIndicator) ...[
            NavBarIndicator(
              cachedChatsCubit: getIt<CachedChatsCubit>(),
            ),
          ]
        ],
      ),
      activeIcon: !showActive
          ? null
          : Stack(
              children: [
                Container(
                  height: 25,
                  child: SvgPicture.asset(item.icon, color: Color(0xff12512a)),
                ),
                if (msgIndicator) ...[
                  NavBarIndicator(cachedChatsCubit: getIt<CachedChatsCubit>())
                ],
              ],
            ),
      label: item.label,
    );
  }
}
