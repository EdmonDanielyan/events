import 'package:flutter/material.dart';

class NavigationUtils {
  static void popScreenIfCan(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).maybePop();
    }
  }
}
