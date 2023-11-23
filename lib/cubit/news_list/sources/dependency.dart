import 'package:dio/dio.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:openapi/openapi.dart';

abstract class NewsListRequestDependency {
  abstract String? filter;
  abstract Pagination<NewsItemData>? pagination;
  Future<Response<GetNews>> call();
}
