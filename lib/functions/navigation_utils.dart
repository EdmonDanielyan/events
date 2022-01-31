import 'package:flutter/material.dart';

class NavigationUtils {
  final BuildContext context;
  const NavigationUtils(this.context);

  void popScreenIfCan() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).maybePop();
    }
  }

  void popToFirstScreenIfCan() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }
}
