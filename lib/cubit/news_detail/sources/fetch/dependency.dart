// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:main_api_client/model/get_news_by_id.dart';

abstract class NewsDetailRequestDependency {
  abstract int? newsId;
  Future<Response<GetNewsById>> call();
}
