import 'package:dio/dio.dart';
import 'package:main_api_client/model/get_search_success.dart';

abstract class SearchRequestDependency {
  abstract String? query;
  Future<Response<GetSearchSuccess>> call();
}
