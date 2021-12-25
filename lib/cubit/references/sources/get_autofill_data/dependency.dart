// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:main_api_client/model/reference_auto_fill.dart';

abstract class GetAutofillRequestDependency {
  Future<Response<ReferenceAutoFill>> call();
}
