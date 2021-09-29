import 'package:flutter/material.dart';

class CustomFeedbackTab {
  final int index;
  final String label;
  final Widget widget;

  const CustomFeedbackTab({
    required this.index,
    required this.label,
    this.widget = const SizedBox(),
  });
}
