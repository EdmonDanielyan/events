// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:main_api_client/model/get_event_by_id.dart';

extension GetEventByIdExt on Response<GetEventById> {
  EventData mapResponse() {
    final responseData = this.data?.data;
    if (responseData != null) {
      return EventData.fromProperty(responseData);
    } else {
      throw UnknownErrorException();
    }
  }
}
