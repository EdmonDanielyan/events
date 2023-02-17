// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/src/response.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:main_api_client/api/content_api.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/model/list_page_success_response_body.dart';
import 'package:main_api_client/model/single_section_success_response_body.dart';

import 'dependency.dart';

@singleton
class ListPageNetworkRequest extends ListPageRequestDependency {
  ListPageNetworkRequest();

  @override
  Future<Response<ListPageSuccessResponseBody>> call() async {
    ContentApi contentApi = getIt<MainApiProvider>().getContentApi();
    return await contentApi.getPagesList();
  }
}
