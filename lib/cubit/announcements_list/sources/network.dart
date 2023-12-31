import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/announcements_list/sources/dependency.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:openapi/openapi.dart';

@injectable
class AnnouncementsListNetworkRequest
    extends AnnouncementsListRequestDependency {
  @override
  Pagination<AnnouncementData>? pagination;

  AnnouncementsListNetworkRequest({@factoryParam required this.pagination})
      : assert(pagination != null);

  @override
  Future<Response<GetAnnouncements>> call() async {
    AnnouncementsApi announcementsApi =
        getIt<MainApiProvider>().getAnnouncementsApi();
    return await announcementsApi.getAnnouncements(
        countOnPage: pagination!.countOnPage,
        pageNumber: pagination!.pageNumber);
  }
}
