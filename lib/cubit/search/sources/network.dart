import 'package:dio/src/response.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/api/search_api.dart';
import 'package:main_api_client/model/get_search_success.dart';

import 'dependency.dart';

class SearchNetworkRequest extends SearchRequestDependency {
  String query;
  SearchNetworkRequest({required this.query});

  @override
  Future<Response<GetSearchSuccess>> makeRequest() async {
    SearchApi search = MainApiClient().getSearchApi();
    return await search.searchGet(query: query);
  }
}
