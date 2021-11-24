import 'package:flutter/material.dart';
import 'package:ink_mobile/models/event_data.dart';

enum EventsDetailStateType { LOADING, LOADED, ERROR }

@immutable
class EventsDetailState {
  final EventData? data;
  final EventsDetailStateType type;
  final String? errorMessage;

  EventsDetailState({required this.type, this.data, this.errorMessage})
      : assert(
            type != EventsDetailStateType.ERROR ||
                (type == EventsDetailStateType.ERROR && errorMessage != null),
            'errorMessage must not be null in error state');
}
