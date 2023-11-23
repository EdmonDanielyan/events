import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/announcements_detail/sources/dependency.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

@injectable
class AnnouncementsDetailNetworkRequest
    extends AnnouncementsDetailRequestDependency {
  @override
  int? announcementId;
  AnnouncementsDetailNetworkRequest(
      {@factoryParam required this.announcementId})
      : assert(announcementId != null);

  @override
  Future<Response<GetAnnouncementById>> call() async {
    AnnouncementsApi announcementsApi =
        getIt<MainApiProvider>().getAnnouncementsApi();
    //TODO: clean code
    return await announcementsApi.getAnnouncementById(id: announcementId ?? 1);
  }
}
