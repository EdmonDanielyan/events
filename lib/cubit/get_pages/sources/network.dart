import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

import 'dependency.dart';

@injectable
class ListPageNetworkRequest extends ListPageRequestDependency {
  ListPageNetworkRequest();

  @override
  Future<Response<ListPageSuccessResponseBody>> call() async {
    ContentApi contentApi = getIt<MainApiProvider>().getContentApi();
    return await contentApi.getPagesList();
  }
}
