import 'package:flutter/material.dart';

class MyPopupRoute extends PopupRoute<void> {
  Widget child;

  MyPopupRoute({required this.child});

  @override
  Color get barrierColor => Colors.black54;

  @override
  bool get barrierDismissible => true;
  @override
  String get barrierLabel => "Close";

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => const Duration(milliseconds: 150);

  @override
  bool get maintainState => true;
}
