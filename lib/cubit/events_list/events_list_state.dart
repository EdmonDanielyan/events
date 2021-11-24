import 'package:flutter/material.dart';
import 'package:ink_mobile/models/event_data.dart';

enum EventsListStateType { LOADING, LOADED, ERROR }

@immutable
class EventsListState {
  final List<EventData>? data;
  final EventsListStateType type;
  final String? errorMessage;

  EventsListState({required this.type, this.data, this.errorMessage})
      : assert(
            type != EventsListStateType.ERROR ||
                (type == EventsListStateType.ERROR && errorMessage != null),
            'errorMessage must not be null in errorState');
}
