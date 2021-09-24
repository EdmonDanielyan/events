import 'package:ink_mobile/cubit/events_list/sources/dependency.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/model/get_events.dart';

class EventListFetch {
  EventListRequestDependency dependency;
  Pagination<EventData> pagination;

  EventListFetch({required this.pagination, required this.dependency});

  Future<Pagination<EventData>> call() async {
    Response<GetEvents> response = await dependency.makeRequest();

    return mapResponse(response);
  }

  Pagination<EventData> mapResponse(Response<GetEvents> response) {
    Map? eventsListData = response.data?.data.asMap;

    if (eventsListData != null) {
      final _newList = List<EventData>.from(pagination.items)
        ..addAll(EventData.getListFromResponse(eventsListData['events']));

      pagination = pagination.copyWith(items: _newList);

      if (eventsListData['next'] == null) {
        pagination.next = false;
      }

      pagination.pageNumber++;

      return pagination;
    } else {
      throw UnknownErrorException();
    }
  }
}
