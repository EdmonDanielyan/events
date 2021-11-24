import 'package:flutter/material.dart';

class NewChatScreenParams {
  final String title;
  final String description;
  final String chosenOneText;
  final String chosenMultipleText;
  final void Function(BuildContext)? onSubmit;
  final List<int> hideIds;

  const NewChatScreenParams({
    required this.title,
    this.description = "",
    required this.chosenOneText,
    required this.chosenMultipleText,
    this.onSubmit,
    this.hideIds = const [],
  });
}
