import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:openapi/openapi.dart';
import 'dependency.dart';

@injectable
class EventCancelNetworkRequest extends EventCancelRequestDependency {
  @override
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
