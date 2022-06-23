// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/src/response.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/builder/comment_params_builder.dart';
import 'package:ink_mobile/models/new_comment_entities.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/model/post_comment_success.dart';

import 'dependency.dart';

@injectable
class NewsCommentsAddNetworkRequest extends NewsCommentsAddRequestDependency {
  NewCommentEntities? comment;
  NewsCommentsAddNetworkRequest({@factoryParam required this.comment})
      : assert(comment != null);

  @override
  Future<Response<PostCommentSuccess>> call() async {
    return await getIt.get<MainApiProvider>().getNewsApi().newsPostcommentPost(
          postComment: CustomCommentParamsBuilder(
                  id: comment!.id,
                  answerId: comment!.answerId,
                  text: comment!.text)
              .build(),
        );
  }
}
