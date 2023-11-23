import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

abstract class AnnouncementsDetailRequestDependency {
  abstract int? announcementId;
  Future<Response<GetAnnouncementById>> call();
}
