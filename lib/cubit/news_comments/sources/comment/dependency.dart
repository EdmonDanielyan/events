// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:ink_mobile/models/new_comment_entities.dart';
import 'package:main_api_client/model/post_comment_success.dart';

abstract class NewsCommentsAddRequestDependency {
  abstract NewCommentEntities? comment;
  Future<Response<PostCommentSuccess>> call();
}
