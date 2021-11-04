import 'package:ink_mobile/models/announcement_data.dart';

enum AnnouncementsListStateType { LOADING, LOADED, ERROR }

class AnnouncementsListState {
  final AnnouncementsListStateType type;
  final List<AnnouncementData>? data;
  final String? errorMessage;

  AnnouncementsListState({required this.type, this.data, this.errorMessage})
      : assert(type != AnnouncementsListStateType.ERROR || errorMessage != null,
            'errorMessage must not be null in error state');
}
