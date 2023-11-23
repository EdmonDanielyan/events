import 'package:dio/dio.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:openapi/openapi.dart';

abstract class EventListRequestDependency {
  abstract Pagination<EventData>? pagination;
  Future<Response<GetEvents>> call();
}
