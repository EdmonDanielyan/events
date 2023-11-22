import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

import 'dependency.dart';

@injectable
class EventsDetailNetworkRequest extends EventsDetailRequestDependency {
  @override
  int? eventId;
  EventsDetailNetworkRequest({@factoryParam required this.eventId})
      : assert(eventId != null);

  @override
  Future<Response<GetEventById>> call() async {
    EventsApi eventApi = getIt<MainApiProvider>().getEventsApi();
    //TODO clean code
    final response = await eventApi.getEventById(id :eventId ?? 1);
    return response;
  }
}
