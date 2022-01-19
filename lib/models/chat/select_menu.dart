import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';

import '../token.dart';

class SelectMessageMenu {
  final String name;
  final Widget icon;

  SelectMessageMenu({required this.name, required this.icon});
}

class SelectMessageMenuList {
  final MessageTable message;
  const SelectMessageMenuList(this.message);

  List<SelectMessageMenu> getStandartList() {
    final strings = localizationInstance;
    double iconSize = 18.0;
    return [
      if (message.userId == JwtPayload.myId) ...[
        SelectMessageMenu(
          name: strings.edit,
          icon: Icon(
            CupertinoIcons.pencil,
            size: iconSize,
          ),
        ),
      ],
      // SelectMessageMenu(
      //   name: strings.sendOn,
      //   icon: Icon(
      //     CupertinoIcons.arrowshape_turn_up_right_fill,
      //     size: iconSize,
      //   ),
      // ),
      SelectMessageMenu(
        name: strings.delete,
        icon: Icon(
          Icons.delete,
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
      // SelectMessageMenu(
      //   name: strings.select,
      //   icon: Icon(
      //     Icons.check_circle,
      //     size: iconSize,
      //   ),
      // ),
      SelectMessageMenu(
        name: strings.quote,
        icon: Icon(
          CupertinoIcons.arrowshape_turn_up_left_fill,
          size: iconSize,
        ),
      ),
    ];
  }
}

class SelectParticipantMenuList {
  static List<SelectMessageMenu> getStandartList() {
    final strings = localizationInstance;
    double iconSize = 18.0;
    return [
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
