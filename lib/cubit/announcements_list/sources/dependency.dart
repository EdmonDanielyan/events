// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:main_api_client/model/get_announcements.dart';

abstract class AnnouncementsListRequestDependency {
  abstract Pagination<AnnouncementData>? pagination;
  Future<Response<GetAnnouncements>> call();
}
