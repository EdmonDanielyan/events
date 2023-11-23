import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

import 'dependency.dart';

@injectable
class SinglePageNetworkRequest extends SinglePageRequestDependency {
  String? id;
  SinglePageNetworkRequest({@factoryParam required this.id})
      : assert(id != null);

  @override
  Future<Response<SinglePageSuccessResponseBody>> call() async {
    ContentApi contentApi = getIt<MainApiProvider>().getContentApi();
    //TODO clean code
    return await contentApi.getPage(idOrCode: id ?? '');
  }
}
