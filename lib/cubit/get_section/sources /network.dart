import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

import 'dependency.dart';

@injectable
class SingleSectionNetworkRequest extends SingleSectionRequestDependency {
  String? code;
  SingleSectionNetworkRequest({@factoryParam required this.code})
      : assert(code != null);

  @override
  Future<Response<SingleSectionSuccessResponseBody>> call() async {
    ContentApi contentApi = getIt<MainApiProvider>().getContentApi();
    //TODO clean code
    return await contentApi.getPagesSection(code: code ?? '');
  }
}
