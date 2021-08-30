import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ink_mobile/components/menu_sheet/menu_sheet.dart';
import 'package:ink_mobile/functions/menu_sheet.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class InkBottomNavBar extends StatefulWidget {
  final InkBottomNavBarItemCodes selectedItemCode;

  const InkBottomNavBar({Key? key, required this.selectedItemCode}) : super(key: key);

  @override
  _InkBottomNavBarState createState() => _InkBottomNavBarState(selectedItemCode: selectedItemCode);
}

class _InkBottomNavBarState extends State<InkBottomNavBar> {
  InkBottomNavBarItemCodes selectedItemCode;

  _InkBottomNavBarState({
    required this.selectedItemCode
  }) : super();

  static List<BottomMenuItem> items = [
    BottomMenuItem(
        id: InkBottomNavBarItemCodes.main,
        label: 'Главная',
        pathToIcon: 'assets/images/home.svg',
        onTap: (context) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/main', (route) => false
          );
        }
    ),
    BottomMenuItem(
        id: InkBottomNavBarItemCodes.search,
        label: 'Поиск',
        pathToIcon: 'assets/images/search.svg',
        onTap: (context) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/search', (route) => false
          );
        }
    ),
    // BottomMenuItem(
    //     id: InkBottomNavBarItemCodes.messages,
    //     label: 'Сообщения',
    //     pathToIcon: 'assets/images/message.svg',
    //     onTap: (context) {
    //       Navigator.pushNamedAndRemoveUntil(
    //           context, '/test', (route) => false
    //       );
    //     }
    // ),
    // BottomMenuItem(
    //     id: InkBottomNavBarItemCodes.services,
    //     label: 'Сервисы',
    //     pathToIcon: 'assets/images/services.svg',
    //     onTap: (context) {
    //       Navigator.pushNamedAndRemoveUntil(
    //           context, '/services', (route) => false
    //       );
    //     }
    // ),
    BottomMenuItem(
        id: InkBottomNavBarItemCodes.menu,
        label: 'Меню',
        pathToIcon: 'assets/images/menu.svg',
        onTap: (context) {
          showMaterialModalBottomSheet(
            backgroundColor: Color(0xfff9f9f9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.0)
              )
            ),
            context: context,
            builder: (context) {
              return MenuSheet();
            }
          );
        }
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final int _selectedIndex = items.indexWhere(
        (element) => element.id == selectedItemCode
    );

    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0xff12512a),
      unselectedItemColor: Colors.grey,
      selectedFontSize: 12.0,
      iconSize: 30,
      type: BottomNavigationBarType.fixed,
      onTap: (curIndex) {
        items[curIndex].onTap(context);
      },
      items: this.getNavBarItems(),
    );
  }

  List<BottomNavigationBarItem> getNavBarItems() {
    List<BottomNavigationBarItem> widgets = [];

    items.forEach((value) {
      String iconPath = value.pathToIcon;

      widgets.add(
          BottomNavigationBarItem(
              icon: Container(
                height: 25,
                child: SvgPicture.asset(
                  '$iconPath',
                ),
              ),
              activeIcon: Container(
                height: 25,
                child: SvgPicture.asset(
                    '$iconPath',
                    color: Color(0xff12512a)
                ),
              ),
              label: value.label,
          )
      );
    });

    return widgets;
  }
}

enum InkBottomNavBarItemCodes {main, search, messages, services, menu}

class BottomMenuItem {
  final InkBottomNavBarItemCodes id;
  final String pathToIcon;
  final String label;
  final Function onTap;

  BottomMenuItem({
    required this.id,
    required this.pathToIcon,
    required this.label,
    required this.onTap
  });
}