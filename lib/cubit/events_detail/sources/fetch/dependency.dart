// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:main_api_client/model/get_event_by_id.dart';

abstract class EventsDetailRequestDependency {
  abstract int? eventId;
  Future<Response<GetEventById>> call();
}
