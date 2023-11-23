import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

abstract class SinglePageRequestDependency {
  Future<Response<SinglePageSuccessResponseBody>> call();
}
