import 'package:main_api_client/model/get_announcement_by_id.dart';
import 'package:dio/dio.dart';

abstract class AnnouncementsDetailRequestDependency {
  abstract int? announcementId;
  Future<Response<GetAnnouncementById>> call();
}
