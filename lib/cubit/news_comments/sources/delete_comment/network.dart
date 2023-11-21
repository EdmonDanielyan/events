// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/src/response.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

import 'dependency.dart';

@injectable
class NewsCommentsDeleteNetworkRequest
    extends NewsCommentsDeleteRequestDependency {
  int? commentId;
  NewsCommentsDeleteNetworkRequest({@factoryParam required this.commentId})
      : assert(commentId != null);

  @override
  Future<Response<NewsLikeSuccess>> call() async {
    return await getIt
        .get<MainApiProvider>()
        .getNewsApi()
        //TODO clean code
        .commentDelete(id: commentId ?? 1);
  }
}
