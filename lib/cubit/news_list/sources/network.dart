// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/src/response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:main_api_client/api/news_api.dart';
import 'package:main_api_client/model/get_news.dart';

import 'dependency.dart';

@injectable
class NewsListNetworkRequest extends NewsListRequestDependency {
  String? filter;
  Pagination<NewsItemData>? pagination;

  NewsListNetworkRequest(
      {@factoryParam required this.pagination,
      @factoryParam required this.filter})
      : assert(filter != null && pagination != null);

  @override
  Future<Response<GetNews>> call() async {
    NewsApi newsApi = sl<MainApiProvider>().getNewsApi();
    return await newsApi.getNews(
      countOnPage: pagination!.countOnPage,
      pageNumber: pagination!.pageNumber,
      filter: filter,
    );
  }
}
