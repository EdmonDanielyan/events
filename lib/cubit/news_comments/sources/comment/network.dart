import 'package:dio/src/response.dart';
import 'package:ink_mobile/core/builder/comment_params_builder.dart';
import 'package:main_api_client/api.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/model/post_comment_success.dart';

import 'dependency.dart';

class NewsCommentsAddNetworkRequest extends NewsCommentsAddRequestDependency {
  int id;
  int? answerId;
  String text;
  NewsCommentsAddNetworkRequest(
      {required this.id, required this.answerId, required this.text});

  @override
  Future<Response<PostCommentSuccess>> makeRequest() async {
    return await MainApiClient()
        .getNewsApi()
        .newsPostcommentPost(
          postComment:
              CustomCommentParamsBuilder(id: id, answerId: answerId, text: text)
                  .build(),
        )
        .timeout(Duration(seconds: 4));
  }
}
