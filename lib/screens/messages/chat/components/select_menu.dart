import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectMessageMenu {
  final String name;
  final Widget icon;

  SelectMessageMenu({required this.name, required this.icon});
}

class SelectMessageMenuList {
  static List<SelectMessageMenu> getStandartList() {
    return [
      SelectMessageMenu(
        name: "Ответить",
        icon: Icon(CupertinoIcons.arrowshape_turn_up_left_fill),
      ),
      SelectMessageMenu(
        name: "Переслать",
        icon: Icon(CupertinoIcons.arrowshape_turn_up_right_fill),
      ),
      SelectMessageMenu(
        name: "Скопировать",
        icon: Icon(Icons.file_copy),
      ),
      SelectMessageMenu(
        name: "Выбрать",
        icon: Icon(Icons.check_circle),
      ),
      SelectMessageMenu(
        name: "Удалить",
        icon: Icon(Icons.delete),
      )
    ];
  }
}
