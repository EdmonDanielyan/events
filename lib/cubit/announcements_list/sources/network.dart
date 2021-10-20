import 'package:dio/src/response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/announcements_list/sources/dependency.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:main_api_client/api/announcements_api.dart';
import 'package:main_api_client/model/get_announcements.dart';

@injectable
class AnnouncementsListNetworkRequest
    extends AnnouncementsListRequestDependency {
  Pagination<AnnouncementData>? pagination;

  AnnouncementsListNetworkRequest({@factoryParam required this.pagination})
      : assert(pagination != null);

  @override
  Future<Response<GetAnnouncements>> call() async {
    AnnouncementsApi announcementsApi =
        sl.get<MainApiProvider>().getAnnouncementsApi();
    return await announcementsApi.getAnnouncements(
        countOnPage: pagination!.countOnPage,
        pageNumber: pagination!.pageNumber);
  }
}
