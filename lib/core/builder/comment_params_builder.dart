// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:main_api_client/model/post_comment.dart';

class CustomCommentParamsBuilder {
  final String text;
  final int id;
  final int? answerId;
  CustomCommentParamsBuilder(
      {required this.text, required this.id, required this.answerId});

  PostComment build() {
    PostCommentBuilder commentBuilder = PostCommentBuilder();

    commentBuilder.text = text;
    commentBuilder.newsId = id;

    if (answerId != null) {
      commentBuilder.parentId = answerId;
    }

    return commentBuilder.build();
  }
}
