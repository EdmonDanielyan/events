import 'package:dio/src/response.dart';
import 'package:main_api_client/api.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/api/news_api.dart';
import 'package:main_api_client/model/get_news_by_id.dart';

import 'dependency.dart';

class NewsDetailNetworkRequest extends NewsDetailRequestDependency {
  int newsId;
  NewsDetailNetworkRequest({required this.newsId});

  @override
  Future<Response<GetNewsById>> makeRequest() async {
    NewsApi newsApi = MainApiClient().getNewsApi();
    return await newsApi.newsIdGet(newsId);
  }
}
