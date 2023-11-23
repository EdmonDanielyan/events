import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

abstract class EventsDetailRequestDependency {
  abstract int? eventId;
  Future<Response<GetEventById>> call();
}
