import 'package:flutter/material.dart';

class App extends NavigatorState {
  static GlobalKey<NavigatorState>? materialKey = GlobalKey();

  static BuildContext? get getContext => materialKey?.currentState?.context;
}
