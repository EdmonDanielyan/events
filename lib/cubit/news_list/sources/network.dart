import 'package:dio/src/response.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/api/news_api.dart';
import 'package:main_api_client/model/get_news.dart';

import 'dependency.dart';

class NewsListNetworkRequest extends NewsListRequestDependency {
  String filter;
  Pagination<NewsItemData> pagination;

  NewsListNetworkRequest({required this.pagination, required this.filter});

  @override
  Future<Response<GetNews>> makeRequest() async {
    NewsApi newsApi = MainApiClient().getNewsApi();
    return await newsApi.getNews(
      countOnPage: pagination.countOnPage,
      pageNumber: pagination.pageNumber,
      filter: filter,
    );
  }
}
