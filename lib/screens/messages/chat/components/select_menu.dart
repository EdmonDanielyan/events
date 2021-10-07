import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ink_mobile/localization/strings/language.dart';

class SelectMessageMenu {
  final String name;
  final Widget icon;

  SelectMessageMenu({required this.name, required this.icon});
}

class SelectMessageMenuList {
  static List<SelectMessageMenu> getStandartList(LanguageStrings strings) {
    double iconSize = 18.0;
    return [
      SelectMessageMenu(
        name: strings.reply,
        icon: Icon(
          CupertinoIcons.arrowshape_turn_up_left_fill,
          size: iconSize,
        ),
      ),
      SelectMessageMenu(
        name: strings.sendOn,
        icon: Icon(
          CupertinoIcons.arrowshape_turn_up_right_fill,
          size: iconSize,
        ),
      ),
      SelectMessageMenu(
        name: strings.copy,
        icon: Icon(
          Icons.file_copy,
          size: iconSize,
        ),
      ),
      SelectMessageMenu(
        name: strings.select,
        icon: Icon(
          Icons.check_circle,
          size: iconSize,
        ),
      ),
      SelectMessageMenu(
        name: strings.delete,
        icon: Icon(
          Icons.delete,
          size: iconSize,
        ),
      )
    ];
  }
}
