import 'package:main_api_client/model/get_comments_by_id.dart';
import 'package:dio/dio.dart';

abstract class NewsCommentsFetchRequestDependency {
  abstract int newsId;
  Future<Response<GetCommentsById>> makeRequest();
}
