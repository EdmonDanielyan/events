import 'package:dio/dio.dart';
import 'package:ink_mobile/models/new_comment_entities.dart';
import 'package:main_api_client/model/post_comment_success.dart';

abstract class NewsCommentsAddRequestDependency {
  abstract NewCommentEntities? comment;
  Future<Response<PostCommentSuccess>> call();
}
