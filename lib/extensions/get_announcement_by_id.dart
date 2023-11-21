// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:openapi/openapi.dart';

extension GetAnnouncementByIdExt on Response<GetAnnouncementById> {
  AnnouncementData mapResponse() {
    final announcementData = this.data?.data;
    if (announcementData != null)
      return AnnouncementData.fromProperty(announcementData);
    else
      throw UnknownErrorException();
  }
}
