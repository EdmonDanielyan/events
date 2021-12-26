// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:main_api_client/model/birthdays_success.dart';
import 'package:dio/dio.dart';

abstract class BirthdaysRequestDependency {
  Future<Response<BirthdaysSuccess>> call();
}
