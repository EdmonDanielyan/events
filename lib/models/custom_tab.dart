import 'package:flutter/material.dart';

class CustomSectionTab {
  final int index;
  final String name;
  final String label;
  final Widget widget;

  const CustomSectionTab({
    required this.index,
    this.name = "",
    required this.label,
    this.widget = const SizedBox(),
  });
}

class CustomSectionSwitcher {
  int activeIndex;
  List<CustomSectionTab> tabs;
  CustomSectionSwitcher({this.activeIndex = 0, this.tabs = const []});
}
