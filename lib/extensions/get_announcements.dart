import 'package:dio/dio.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:openapi/openapi.dart';

extension GetAnnouncementsExt on Response<GetAnnouncements> {
  Pagination<AnnouncementData> mapResponse(
      Pagination<AnnouncementData> pagination) {
    Map? announcementsListData = data?.data.asMap;

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
