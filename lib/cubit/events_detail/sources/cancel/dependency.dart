import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

abstract class EventCancelRequestDependency {
  abstract int? eventId;
  Future<Response<AddEventMember>> call();
}
