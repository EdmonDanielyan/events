import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

abstract class SingleSectionRequestDependency {
  Future<Response<SingleSectionSuccessResponseBody>> call();
}
