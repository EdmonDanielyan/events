import 'package:ink_mobile/models/search/data.dart';

class SearchModel {
  List<UsersSearchData> usersList;
  List<EventsSearchData> eventsList;
  List<AnnouncementsSearchData> announcementsList;
  List<NewsSearchData> newsList;
  SearchModel({
    this.usersList = const [],
    this.eventsList = const [],
    this.announcementsList = const [],
    this.newsList = const [],
  });

  SearchModel copyWith({
    List<UsersSearchData>? usersList,
    List<EventsSearchData>? eventsList,
    List<AnnouncementsSearchData>? announcementsList,
    List<NewsSearchData>? newsList,
  }) {
    return SearchModel(
      usersList: usersList ?? this.usersList,
      eventsList: eventsList ?? this.eventsList,
      announcementsList: announcementsList ?? this.announcementsList,
      newsList: newsList ?? this.newsList,
    );
  }

  bool isEmpty() =>
      newsList.isEmpty &&
      eventsList.isEmpty &&
      announcementsList.isEmpty &&
      newsList.isEmpty &&
      usersList.isEmpty;
}

class SearchModelListView {
  static List<UsersSearchData> mapUsers(List? users) {
    List<UsersSearchData> items = [];

    users?.forEach((user) {
      items.add(
        UsersSearchData(
          id: user['id'],
          fullName: "${user['lastname'] ?? ""} ${user['name'] ?? ""}".trim(),
          avatar: user["avatar"] ?? "",
          workPosition: user["work_position"] ?? "",
        ),
      );
    });

    return items;
  }

  static List<EventsSearchData> mapEvents(List? events) {
    List<EventsSearchData> items = [];

    events?.forEach((event) {
      items.add(EventsSearchData(id: event['id'], title: event['title']));
    });

    return items;
  }

  static List<AnnouncementsSearchData> mapAnnouncements(List? announcements) {
    List<AnnouncementsSearchData> items = [];

    announcements?.forEach((announcement) {
      items.add(AnnouncementsSearchData(
          id: announcement['id'], title: announcement['title']));
    });

    return items;
  }

  static List<NewsSearchData> mapNews(List? news) {
    List<NewsSearchData> items = [];

    news?.forEach((newsItem) {
      items.add(NewsSearchData(id: newsItem['id'], title: newsItem['title']));
    });

    return items;
  }
}
