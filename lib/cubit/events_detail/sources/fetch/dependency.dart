import 'package:dio/dio.dart';
import 'package:main_api_client/model/get_event_by_id.dart';

abstract class EventsDetailRequestDependency {
  abstract int? eventId;
  Future<Response<GetEventById>> call();
}
