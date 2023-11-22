import 'package:dio/dio.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:openapi/openapi.dart';

extension GetAnnouncementByIdExt on Response<GetAnnouncementById> {
  AnnouncementData mapResponse() {
    final announcementData = data?.data;
    if (announcementData != null) {
      return AnnouncementData.fromProperty(announcementData);
    } else {
      throw UnknownErrorException();
    }
  }
}
