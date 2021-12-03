import 'package:flutter/material.dart';
import 'package:ink_mobile/models/chat/database/chat_db.dart';

class NewChatScreenParams {
  final String title;
  final String description;
  final String chosenOneText;
  final String chosenMultipleText;
  final void Function(BuildContext)? onSubmit;
  final void Function(BuildContext, UserTable)? onUserTap;
  final List<int> hideIds;

  const NewChatScreenParams({
    required this.title,
    this.description = "",
    this.onUserTap,
    required this.chosenOneText,
    required this.chosenMultipleText,
    this.onSubmit,
    this.hideIds = const [],
  });
}
