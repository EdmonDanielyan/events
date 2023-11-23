import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

abstract class ListPageRequestDependency {
  Future<Response<ListPageSuccessResponseBody>> call();
}
