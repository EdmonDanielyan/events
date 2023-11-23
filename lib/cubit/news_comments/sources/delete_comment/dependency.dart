import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

abstract class NewsCommentsDeleteRequestDependency {
  abstract int? commentId;
  Future<Response<NewsLikeSuccess>> call();
}
