import 'package:flutter/material.dart';
import 'package:ink_mobile/models/birthday_data.dart';

enum BirthdaysStateType {LOADING, LOADED, ERROR, EMPTY}

@immutable
class BirthdaysState {
  final List<BirthdayData>? birthdaysToday;
  final List<BirthdayData>? birthdaysOther;
  final BirthdaysStateType type;
  final String? errorMessage;

  BirthdaysState({
    required this.type,
    this.birthdaysToday,
    this.birthdaysOther,
    this.errorMessage
  }) : assert(
    type != BirthdaysStateType.ERROR
    || (type == BirthdaysStateType.ERROR && errorMessage != null),
    'errorMessage must not be null in error state'
  );
}