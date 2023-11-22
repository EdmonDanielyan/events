import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:openapi/openapi.dart';

import 'dependency.dart';

@injectable
class EventsListNetworkRequest extends EventListRequestDependency {
  @override
  Pagination<EventData>? pagination;

  EventsListNetworkRequest({@factoryParam required this.pagination})
      : assert(pagination != null);

  @override
  Future<Response<GetEvents>> call() async {
    EventsApi eventsApi = getIt<MainApiProvider>().getEventsApi();
    return await eventsApi.getEvents(
        countOnPage: pagination!.countOnPage,
        pageNumber: pagination!.pageNumber);
  }
}
