import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

import 'dependency.dart';

@injectable
class NewsCommentsFetchNetworkRequest
    extends NewsCommentsFetchRequestDependency {
  @override
  int? newsId;
  NewsCommentsFetchNetworkRequest({@factoryParam required this.newsId})
      : assert(newsId != null);

  @override
  Future<Response<GetCommentsById>> call() async {
    NewsApi newsApi = getIt<MainApiProvider>().getNewsApi();
    //TODO: clean code
    return await newsApi.newsCommentsIdGet(id: newsId ?? 1);
  }
}
