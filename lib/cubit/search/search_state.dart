import 'package:ink_mobile/models/search/data.dart';


enum SearchStateType {STARTING, LOADING, EMPTY, LOADED, ERROR}

class SearchState {
  final SearchStateType type;
  List<UsersSearchData>? users;
  List<AnnouncementsSearchData>? announcements;
  List<EventsSearchData>? events;
  List<NewsSearchData>? news;
  String? errorMessage;

  SearchState({
    required this.type,
    this.users,
    this.announcements,
    this.events,
    this.news,
    this.errorMessage
  }) : assert(
    type != SearchStateType.ERROR
    || errorMessage != null,
    'errorMessage must not be null in error state'
  );
}
