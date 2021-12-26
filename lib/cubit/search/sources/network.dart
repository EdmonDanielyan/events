// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/src/response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:main_api_client/api/search_api.dart';
import 'package:main_api_client/model/get_search_success.dart';

import 'dependency.dart';

@injectable
class SearchNetworkRequest extends SearchRequestDependency {
  String? query;
  SearchNetworkRequest({@factoryParam required this.query})
      : assert(query != null);

  @override
  Future<Response<GetSearchSuccess>> call() async {
    SearchApi search = sl<MainApiProvider>().getSearchApi();
    return await search.searchGet(query: query);
  }
}
