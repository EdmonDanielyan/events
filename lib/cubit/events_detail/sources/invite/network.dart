import 'package:dio/src/response.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/api/events_api.dart';
import 'package:main_api_client/model/add_event_member.dart';

import 'dependency.dart';

class EventInviteNetworkRequest extends EventInviteRequestDependency {
  int eventId;
  EventInviteNetworkRequest({required this.eventId});

  @override
  Future<Response<AddEventMember>> makeRequest() async {
    EventsApi eventApi = MainApiClient().getEventsApi();
    return await eventApi.eventsAddeventmemberIdGet(eventId);
  }
}
