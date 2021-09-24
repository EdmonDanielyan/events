import 'package:dio/src/response.dart';
import 'package:ink_mobile/cubit/announcements_detail/sources/dependency.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/api/announcements_api.dart';
import 'package:main_api_client/model/get_announcement_by_id.dart';
import 'package:dio/dio.dart';

class AnnouncementsDetailNetworkRequest
    extends AnnouncementsDetailRequestDependency {
  int announcementId;
  AnnouncementsDetailNetworkRequest({required this.announcementId});

  @override
  Future<Response<GetAnnouncementById>> makeRequest() async {
    AnnouncementsApi announcementsApi = MainApiClient().getAnnouncementsApi();
    return await announcementsApi.getAnnouncementById(announcementId);
  }
}
