// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports
import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

abstract class AnnouncementsDetailRequestDependency {
  abstract int? announcementId;
  Future<Response<GetAnnouncementById>> call();
}
