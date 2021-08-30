import 'package:flutter/material.dart';
import 'package:ink_mobile/components/menu_sheet/menu_sheet.dart';

PersistentBottomSheetController showMenuSheet(context) {
  return showBottomSheet(
    backgroundColor: Colors.black.withOpacity(0.7),
    context: context,
    builder: (BuildContext context) {
      return MenuSheet();
    },
  );
}