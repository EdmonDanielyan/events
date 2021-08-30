import 'package:flutter/material.dart';
import 'package:ink_mobile/models/announcement_data.dart';

enum AnnouncementsListStateType {LOADING, LOADED, ERROR}

@immutable
class AnnouncementsListState {
  final List<AnnouncementData>? data;
  final AnnouncementsListStateType type;
  final String? errorMessage;

  AnnouncementsListState({
    required this.type,
    this.data,
    this.errorMessage
  }) : assert(
    type != AnnouncementsListStateType.ERROR
    || (type == AnnouncementsListStateType.ERROR && errorMessage != null),
    'errorMessage must not be null in error state'
  );
}