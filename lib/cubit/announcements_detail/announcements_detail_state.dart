import 'package:ink_mobile/models/announcement_data.dart';

enum AnnouncementsDetailStateType { LOADING, LOADED, ERROR, NOT_FOUND }

class AnnouncementsDetailState {
  final AnnouncementsDetailStateType type;
  AnnouncementData? data;
  String? errorMessage;

  AnnouncementsDetailState({required this.type, this.data, this.errorMessage})
      : assert(
            type != AnnouncementsDetailStateType.ERROR ||
                (type == AnnouncementsDetailStateType.ERROR &&
                    errorMessage != null),
            'errorMessage must not be null in error state');
}
