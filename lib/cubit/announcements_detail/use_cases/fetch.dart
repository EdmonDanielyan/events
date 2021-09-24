import 'package:ink_mobile/cubit/announcements_detail/sources/dependency.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/model/get_announcement_by_id.dart';

class AnnouncementDetailFetch {
  final AnnouncementsDetailRequestDependency dependency;
  AnnouncementDetailFetch({required this.dependency});

  Future<AnnouncementData> call() async {
    Response<GetAnnouncementById> response = await dependency.makeRequest();
    return mapResponse(response);
  }

  AnnouncementData mapResponse(Response<GetAnnouncementById> response) {
    final announcementData = response.data?.data;
    if (announcementData != null) {
      AnnouncementData announcement =
          AnnouncementData.fromProperty(announcementData);

      return announcement;
    } else {
      throw UnknownErrorException();
    }
  }
}
