// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports
import 'package:main_api_client/model/get_announcement_by_id.dart';
import 'package:dio/dio.dart';

abstract class AnnouncementsDetailRequestDependency {
  abstract int? announcementId;
  Future<Response<GetAnnouncementById>> call();
}
