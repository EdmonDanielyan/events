import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

abstract class NewsCommentsFetchRequestDependency {
  abstract int? newsId;
  Future<Response<GetCommentsById>> call();
}
