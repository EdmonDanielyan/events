// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

abstract class ContactsRequestDependency {
  abstract String? query;
  Future<Response<GetContacts>> call();
}
