import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/functions/new_bottom_nav_bar_items.dart';
import 'package:ink_mobile/components/new_bottom_nav_bar/nav_bar_indicator.dart';
import 'package:ink_mobile/constants/palette.dart';
import 'package:ink_mobile/messenger/cubits/cached/chats/cached_chats_cubit.dart';
import 'package:ink_mobile/setup.dart';

mixin class NewBottomNavBarMixin {
  List<NavBottomNavBarItem> navBottomNavBarItems = [
    MainBottomNavBarItem(),
    SearchBottomNavBarItem(),
    MessagesBottomNavBarItem(),
    ServicesBottomNavBarItem(),
    MenuBottomNavBarItem()
  ];

  List<Widget> getScreens() {
    List<Widget> items = [];
    for (var element in navBottomNavBarItems) {
      items.add(element.screen);
    }

    return items;
  }

  List<BottomNavigationBarItem> getItems({
    bool showActive = true,
    double iconHeight = 25.0,
    double activeIconHeight = 25.0,
  }) {
    List<BottomNavigationBarItem> items = [];
    for (var element in navBottomNavBarItems) {
      items.add(
        _buildNewBottomNavItem(
          element,
          showActive: showActive,
          msgIndicator: element is MessagesBottomNavBarItem ? true : false,
          iconHeight: iconHeight,
          activeIconHeight: activeIconHeight,
        ),
      );
    }

    return items;
  }

  BottomNavigationBarItem _buildNewBottomNavItem(
    NavBottomNavBarItem item, {
    bool showActive = true,
    bool msgIndicator = false,
    double iconHeight = 25.0,
    double activeIconHeight = 25.0,
  }) {
    return BottomNavigationBarItem(
      icon: Stack(
        children: [
          Container(
            height: iconHeight,
            margin: const EdgeInsets.only(bottom: 4.0),
            child: SvgPicture.asset(
              item.icon,
              height: iconHeight,
              colorFilter:
                  ColorFilter.mode(Palette.textBlack50, BlendMode.srcIn),
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
                  height: activeIconHeight,
                  margin: const EdgeInsets.only(bottom: 4.0),
                  child: SvgPicture.asset(
                    item.icon,
                    height: activeIconHeight,
                    colorFilter:
                        ColorFilter.mode(Palette.greenE4A, BlendMode.srcIn),
                  ),
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
