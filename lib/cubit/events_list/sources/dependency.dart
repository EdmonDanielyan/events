// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:main_api_client/model/get_events.dart';

abstract class EventListRequestDependency {
  abstract Pagination<EventData>? pagination;
  Future<Response<GetEvents>> call();
}
