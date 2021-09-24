import 'package:dio/src/response.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/cubit/announcements_list/sources/dependency.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/api/announcements_api.dart';
import 'package:main_api_client/model/get_announcements.dart';

class AnnouncementsListNetworkRequest
    extends AnnouncementsListRequestDependency {
  Pagination<AnnouncementData> pagination;

  AnnouncementsListNetworkRequest({required this.pagination});

  @override
  Future<Response<GetAnnouncements>> makeRequest() async {
    AnnouncementsApi announcementsApi = MainApiClient().getAnnouncementsApi();
    return await announcementsApi.getAnnouncements(
        countOnPage: pagination.countOnPage, pageNumber: pagination.pageNumber);
  }
}
