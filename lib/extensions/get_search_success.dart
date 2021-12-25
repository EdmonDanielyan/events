// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:ink_mobile/models/search/data.dart';
import 'package:ink_mobile/models/search/search_model.dart';
import 'package:main_api_client/model/get_search_success.dart';

extension GetSearchSuccessExt on Response<GetSearchSuccess> {
  SearchModel? mapResponse() {
    if (this.data?.data == null) return null;

    Map? data = this.data?.data.asMap;

    List? users = data?['users'];
    List? events = data?['events'];
    List? announcements = data?['announcement'];
    List? news = data?['news'];

    List<UsersSearchData> usersList = SearchModelListView.mapUsers(users);
    List<EventsSearchData> eventsList = SearchModelListView.mapEvents(events);
    List<AnnouncementsSearchData> announcementsList =
        SearchModelListView.mapAnnouncements(announcements);
    List<NewsSearchData> newsList = SearchModelListView.mapNews(news);

    return SearchModel(
      usersList: usersList,
      eventsList: eventsList,
      announcementsList: announcementsList,
      newsList: newsList,
    );
  }
}
