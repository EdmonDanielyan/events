import 'package:dio/dio.dart';
import 'package:ink_mobile/models/new_comment_entities.dart';
import 'package:openapi/openapi.dart';

abstract class NewsCommentsAddRequestDependency {
  abstract NewCommentEntities? comment;
  Future<Response<PostCommentSuccess>> call();
}
