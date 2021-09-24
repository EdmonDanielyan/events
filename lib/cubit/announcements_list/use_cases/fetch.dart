import 'package:ink_mobile/cubit/announcements_list/sources/dependency.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/model/get_announcements.dart';

class AnnouncementsListFetch {
  AnnouncementsListRequestDependency dependency;
  Pagination<AnnouncementData> pagination;

  AnnouncementsListFetch({required this.pagination, required this.dependency});

  Future<Pagination<AnnouncementData>> call() async {
    Response<GetAnnouncements> response = await dependency.makeRequest();

    return mapResponse(response);
  }

  Pagination<AnnouncementData> mapResponse(
      Response<GetAnnouncements> response) {
    Map? announcementsListData = response.data?.data.asMap;

    if (announcementsListData != null) {
      final _newList = List<AnnouncementData>.from(pagination.items)
        ..addAll(AnnouncementData.getListFromMap(
            announcementsListData['announcements']));

      pagination = pagination.copyWith(items: _newList);

      if (announcementsListData['next'] == null) {
        pagination.next = false;
      }

      pagination.pageNumber++;

      return pagination;
    } else {
      throw UnknownErrorException();
    }
  }
}
