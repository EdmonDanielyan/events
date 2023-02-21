// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/src/response.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:main_api_client/api/content_api.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/model/single_page_success_response_body.dart';

import 'dependency.dart';

@injectable
class SinglePageNetworkRequest extends SinglePageRequestDependency {
  String? code;
  SinglePageNetworkRequest(
      {@factoryParam required this.code})
      : assert(code != null);

  @override
  Future<Response<SinglePageSuccessResponseBody>> call() async {
    ContentApi contentApi = getIt<MainApiProvider>().getContentApi();
    return await contentApi.getPage(code);
  }
}
