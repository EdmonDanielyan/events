import 'package:dio/dio.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:openapi/openapi.dart';

extension GetEventByIdExt on Response<GetEventById> {
  EventData mapResponse() {
    final responseData = data?.data;
    if (responseData != null) {
      return EventData.fromProperty(responseData);
    } else {
      throw UnknownErrorException();
    }
  }
}
