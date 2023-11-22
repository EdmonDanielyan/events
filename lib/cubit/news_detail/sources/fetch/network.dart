import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';
import 'dependency.dart';

@injectable
class NewsDetailNetworkRequest extends NewsDetailRequestDependency {
  @override
  int? newsId;
  NewsDetailNetworkRequest({@factoryParam required this.newsId})
      : assert(newsId != null);

  @override
  Future<Response<GetNewsById>> call() async {
    NewsApi newsApi = getIt<MainApiProvider>().getNewsApi();
    //TODO: clean code
    return await newsApi.newsIdGet(id: newsId ?? 1);
  }
}
