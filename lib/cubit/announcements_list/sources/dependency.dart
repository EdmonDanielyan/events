import 'package:dio/dio.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:openapi/openapi.dart';

abstract class AnnouncementsListRequestDependency {
  abstract Pagination<AnnouncementData>? pagination;
  Future<Response<GetAnnouncements>> call();
}
