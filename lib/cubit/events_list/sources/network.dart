import 'package:dio/src/response.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/api/events_api.dart';
import 'package:main_api_client/model/get_events.dart';

import 'dependency.dart';

class EventsListNetworkRequest extends EventListRequestDependency {
  Pagination<EventData> pagination;

  EventsListNetworkRequest({required this.pagination});

  @override
  Future<Response<GetEvents>> makeRequest() async {
    EventsApi eventsApi = MainApiClient().getEventsApi();
    return await eventsApi.getEvents(
        countOnPage: pagination.countOnPage, pageNumber: pagination.pageNumber);
  }
}
