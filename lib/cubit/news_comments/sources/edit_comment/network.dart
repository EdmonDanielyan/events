// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/src/response.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/builder/patch_comment_builder.dart';
import 'package:ink_mobile/models/new_comment_entities.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

import 'dependency.dart';

@injectable
class NewsCommentsEditNetworkRequest extends NewsCommentsEditRequestDependency {
  EditingCommentEntities? comment;
  NewsCommentsEditNetworkRequest({@factoryParam required this.comment})
      : assert(comment != null);

  @override
  Future<Response<NewsLikeSuccess>> call() async {
    return await getIt.get<MainApiProvider>().getNewsApi().commentUpdate(comment!.id,
      patchComment: CustomPatchCommentParamsBuilder(
                  text: comment!.text).build(),
        );
  }
}
