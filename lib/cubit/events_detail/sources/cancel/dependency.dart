// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';


abstract class EventCancelRequestDependency {
  abstract int? eventId;
  Future<Response<AddEventMember>> call();
}
