import 'package:dio/dio.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:openapi/openapi.dart';

extension GetEventsExt on Response<UniEventsGetListRespBody> {
  Pagination<EventData> mapResponse(Pagination<EventData> pagination) {
    Map? eventsListData = data?.data.events?.asMap();

    if (eventsListData != null) {
      print('eventList data ne null');
      print('type');
      print(eventsListData.runtimeType);
      final _newList = List<EventData>.from(pagination.items)
        ..addAll(EventData.getListFromResponse(eventsListData['events']));

      pagination = pagination.copyWith(items: _newList);

      // if (eventsListData['next'] == null) {
      //   pagination.next = false;
      // }

      // pagination.pageNumber++;

      return pagination;
    } else {
      throw UnknownErrorException();
    }
  }
}


// extension GetEventsExt on Response<GetEvents> {
//   Pagination<EventData> mapResponse(Pagination<EventData> pagination) {
//     Map? eventsListData = data?.data.asMap;

//     if (eventsListData != null) {
//       final _newList = List<EventData>.from(pagination.items)
//         ..addAll(EventData.getListFromResponse(eventsListData['events']));

//       pagination = pagination.copyWith(items: _newList);

//       if (eventsListData['next'] == null) {
//         pagination.next = false;
//       }

//       pagination.pageNumber++;

//       return pagination;
//     } else {
//       throw UnknownErrorException();
//     }
//   }
// }

