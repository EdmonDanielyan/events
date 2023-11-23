import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

abstract class EventInviteRequestDependency {
  abstract int? eventId;
  Future<Response<AddEventMember>> call();
}
