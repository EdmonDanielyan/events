import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:openapi/openapi.dart';

import 'dependency.dart';

@injectable
class SearchNetworkRequest extends SearchRequestDependency {
  @override
  String? query;
  SearchNetworkRequest({@factoryParam required this.query})
      : assert(query != null);

  @override
  Future<Response<GetSearchSuccess>> call() async {
    SearchApi search = getIt<MainApiProvider>().getSearchApi();
    return await search.searchGet(query: query);
  }
}
