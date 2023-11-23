import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

abstract class GetAutofillRequestDependency {
  Future<Response<ReferenceAutoFill>> call();
}
