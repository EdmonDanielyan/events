// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/src/response.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/api/events_api.dart';
import 'package:main_api_client/model/get_event_by_id.dart';

import 'dependency.dart';

@injectable
class EventsDetailNetworkRequest extends EventsDetailRequestDependency {
  int? eventId;
  EventsDetailNetworkRequest({@factoryParam required this.eventId})
      : assert(eventId != null);

  @override
  Future<Response<GetEventById>> call() async {
    EventsApi eventApi = getIt<MainApiProvider>().getEventsApi();
    final response = await eventApi.getEventById(eventId);
    return response;
  }
}
