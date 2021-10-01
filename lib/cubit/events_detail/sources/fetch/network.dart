import 'package:dio/src/response.dart';
import 'package:main_api_client/api.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/api/events_api.dart';
import 'package:main_api_client/model/get_event_by_id.dart';

import 'dependency.dart';

class EventsDetailNetworkRequest extends EventsDetailRequestDependency {
  int eventId;
  EventsDetailNetworkRequest({required this.eventId});

  @override
  Future<Response<GetEventById>> makeRequest() async {
    EventsApi eventApi = MainApiClient().getEventsApi();
    return await eventApi.getEventById(eventId);
  }
}
