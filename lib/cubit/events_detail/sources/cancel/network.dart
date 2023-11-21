// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/src/response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:openapi/openapi.dart';
import 'dependency.dart';

@injectable
class EventCancelNetworkRequest extends EventCancelRequestDependency {
  int? eventId;
  EventCancelNetworkRequest({@factoryParam required this.eventId})
      : assert(eventId != null);

  @override
  Future<Response<AddEventMember>> call() async {
    EventsApi eventApi = getIt<MainApiProvider>().getEventsApi();
    //TODO clean code
    return await eventApi.eventsRemoveeventmemberIdGet(id: eventId ?? 1);
  }
}
