// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/src/response.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/api/news_api.dart';
import 'package:main_api_client/model/get_news_by_id.dart';

import 'dependency.dart';

@injectable
class NewsDetailNetworkRequest extends NewsDetailRequestDependency {
  int? newsId;
  NewsDetailNetworkRequest({@factoryParam required this.newsId})
      : assert(newsId != null);

  @override
  Future<Response<GetNewsById>> call() async {
    NewsApi newsApi = sl<MainApiProvider>().getNewsApi();
    return await newsApi.newsIdGet(newsId);
  }
}
