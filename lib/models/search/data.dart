import 'package:ink_mobile/models/absence.dart';

abstract class SearchData {
  int id;

  SearchData({required this.id});
}

abstract class TextSearchData extends SearchData {
  String title;

  TextSearchData({required id, required this.title}) : super(id: id);
}

class AnnouncementsSearchData extends TextSearchData {
  AnnouncementsSearchData({required id, required title})
      : super(id: id, title: title);
}

class EventsSearchData extends TextSearchData {
  EventsSearchData({required id, required title}) : super(id: id, title: title);
}

class NewsSearchData extends TextSearchData {
  NewsSearchData({required id, required title}) : super(id: id, title: title);
}

class UsersSearchData extends SearchData {
  String fullName;
  String avatar;
  String workPosition;
  Absence? absence;
  DateTime? birthday;

  UsersSearchData({
    required id,
    required this.fullName,
    required this.avatar,
    required this.workPosition,
    this.absence,
    this.birthday,
  }) : super(id: id);
}
