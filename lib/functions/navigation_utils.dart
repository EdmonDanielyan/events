import 'package:flutter/material.dart';

class NavigationUtils {
  final BuildContext context;
  const NavigationUtils(this.context);

  void popScreenIfCan() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).maybePop();
    }
  }
}
