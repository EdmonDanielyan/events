import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:openapi/openapi.dart';
import 'dependency.dart';

@injectable
class NewsListNetworkRequest extends NewsListRequestDependency {
  @override
  String? filter;
  @override
  Pagination<NewsItemData>? pagination;

  NewsListNetworkRequest(
      {@factoryParam required this.pagination,
      @factoryParam required this.filter})
      : assert(filter != null && pagination != null);

  @override
  Future<Response<GetNews>> call() async {
    NewsApi newsApi = getIt<MainApiProvider>().getNewsApi();
    return await newsApi.getNews(
      countOnPage: pagination!.countOnPage,
      pageNumber: pagination!.pageNumber,
      filter: filter,
    );
  }
}
