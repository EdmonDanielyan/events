import 'package:dio/src/response.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/announcements_detail/sources/dependency.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:main_api_client/api/announcements_api.dart';
import 'package:main_api_client/model/get_announcement_by_id.dart';
import 'package:dio/dio.dart';

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
        sl<MainApiProvider>().getAnnouncementsApi();
    return await announcementsApi.getAnnouncementById(announcementId);
  }
}
