import 'package:ink_mobile/cubit/search/sources/dependency.dart';
import 'package:ink_mobile/models/search/data.dart';
import 'package:ink_mobile/models/search/search_model.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/model/get_search_success.dart';

class GlobalSearch {
  final SearchRequestDependency dependency;

  GlobalSearch({required this.dependency});

  Future<SearchModel?> call() async {
    Response<GetSearchSuccess> response = await dependency.makeRequest();

    return mapResponse(response);
  }

  SearchModel? mapResponse(Response<GetSearchSuccess> response) {
    if (response.data?.data == null) return null;

    Map? data = response.data?.data.asMap;

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
