import 'package:main_api_client/api.dart';
import 'package:main_api_client/api/news_api.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/model/get_comments_by_id.dart';

import 'dependency.dart';

class NewsCommentsFetchNetworkRequest
    extends NewsCommentsFetchRequestDependency {
  int newsId;
  NewsCommentsFetchNetworkRequest({required this.newsId});

  @override
  Future<Response<GetCommentsById>> makeRequest() async {
    NewsApi newsApi = MainApiClient().getNewsApi();
    return await newsApi.newsCommentsIdGet(newsId);
  }
}
