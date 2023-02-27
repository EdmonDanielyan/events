// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:main_api_client/model/single_page_success_response_body.dart';

abstract class SinglePageRequestDependency {
  Future<Response<SinglePageSuccessResponseBody>> call();
}