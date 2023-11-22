import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

import 'dependency.dart';

@injectable
class NewsCommentsDeleteNetworkRequest
    extends NewsCommentsDeleteRequestDependency {
  @override
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
