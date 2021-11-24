import 'package:dio/dio.dart';
import 'package:main_api_client/model/get_news_by_id.dart';

abstract class NewsDetailRequestDependency {
  abstract int? newsId;
  Future<Response<GetNewsById>> call();
}
