import 'package:dio/dio.dart';
import 'package:main_api_client/model/reference_auto_fill.dart';

abstract class GetAutofillRequestDependency {
  Future<Response<ReferenceAutoFill>> makeRequest();
}
