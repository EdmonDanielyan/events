// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/src/response.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/announcements_detail/sources/dependency.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

@injectable
class AnnouncementsDetailNetworkRequest
    extends AnnouncementsDetailRequestDependency {
  int? announcementId;
  AnnouncementsDetailNetworkRequest(
      {@factoryParam required this.announcementId})
      : assert(announcementId != null);

  @override
  Future<Response<GetAnnouncementById>> call() async {
    AnnouncementsApi announcementsApi =
        getIt<MainApiProvider>().getAnnouncementsApi();
    return await announcementsApi.getAnnouncementById(announcementId);
  }
}
