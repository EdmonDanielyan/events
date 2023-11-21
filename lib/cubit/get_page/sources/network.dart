// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/src/response.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

import 'dependency.dart';

@injectable
class SinglePageNetworkRequest extends SinglePageRequestDependency {
  String? id;
  SinglePageNetworkRequest(
      {@factoryParam required this.id})
      : assert(id != null);

  @override
  Future<Response<SinglePageSuccessResponseBody>> call() async {
    ContentApi contentApi = getIt<MainApiProvider>().getContentApi();
    return await contentApi.getPage(id);
  }
}
