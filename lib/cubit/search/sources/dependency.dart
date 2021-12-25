// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:main_api_client/model/get_search_success.dart';

abstract class SearchRequestDependency {
  abstract String? query;
  Future<Response<GetSearchSuccess>> call();
}
