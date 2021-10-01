import 'package:ink_mobile/cubit/events_detail/sources/fetch/dependency.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/model/get_event_by_id.dart';

class EventDetailFetch {
  EventsDetailRequestDependency dependency;

  EventDetailFetch({required this.dependency});

  Future<EventData> call() async {
    Response<GetEventById> response = await dependency.makeRequest();
    return mapResponse(response);
  }

  EventData mapResponse(Response<GetEventById> response) {
    final responseData = response.data?.data;
    if (responseData != null) {
      return EventData.fromProperty(responseData);
    } else {
      throw UnknownErrorException();
    }
  }
}
