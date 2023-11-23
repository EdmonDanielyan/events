import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

abstract class NewsDetailRequestDependency {
  abstract int? newsId;
  Future<Response<GetNewsById>> call();
}
