// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:main_api_client/model/add_event_member.dart';

abstract class EventInviteRequestDependency {
  abstract int? eventId;
  Future<Response<AddEventMember>> call();
}
