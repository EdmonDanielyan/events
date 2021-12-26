// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/src/response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:main_api_client/api/events_api.dart';
import 'package:main_api_client/model/add_event_member.dart';

import 'dependency.dart';

@injectable
class EventInviteNetworkRequest extends EventInviteRequestDependency {
  int? eventId;
  EventInviteNetworkRequest({@factoryParam required this.eventId})
      : assert(eventId != null);

  @override
  Future<Response<AddEventMember>> call() async {
    EventsApi eventApi = sl<MainApiProvider>().getEventsApi();
    return await eventApi.eventsAddeventmemberIdGet(eventId);
  }
}
