import 'package:dio/dio.dart';
import 'package:main_api_client/model/post_comment_success.dart';

abstract class NewsCommentsAddRequestDependency {
  abstract int id;
  abstract int? answerId;
  abstract String text;
  Future<Response<PostCommentSuccess>> makeRequest();
}
