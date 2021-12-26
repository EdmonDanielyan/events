// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:main_api_client/model/can_inquire.dart';

abstract class CanInquireRequestDependency {
  Future<Response<CanInquire>> call();
}
