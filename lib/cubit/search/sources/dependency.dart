import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

abstract class SearchRequestDependency {
  abstract String? query;
  Future<Response<GetSearchSuccess>> call();
}
