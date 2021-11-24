import 'package:ink_mobile/models/event_data.dart';

enum EventsListStateType { LOADING, LOADED, ERROR }

class EventsListState {
  final EventsListStateType type;
  final List<EventData>? data;
  final String? errorMessage;

  EventsListState({required this.type, this.data, this.errorMessage})
      : assert(type != EventsListStateType.ERROR || errorMessage != null,
            'errorMessage must not be null in error state');
}
