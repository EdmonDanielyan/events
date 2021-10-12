import 'package:flutter/material.dart';

class SelectedMessage {
  final String title;
  final String body;
  final Color titleColor;

  const SelectedMessage({
    required this.title,
    required this.body,
    this.titleColor = Colors.green,
  });
}
