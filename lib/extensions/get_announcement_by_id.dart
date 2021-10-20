import 'package:dio/dio.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:main_api_client/model/get_announcement_by_id.dart';

extension GetAnnouncementByIdExt on Response<GetAnnouncementById> {
  mapResponse() {
    final announcementData = this.data?.data;
    if (announcementData != null)
      return AnnouncementData.fromProperty(announcementData);
    else
      throw UnknownErrorException();
  }
}
