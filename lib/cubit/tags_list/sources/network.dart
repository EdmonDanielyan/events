// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/src/response.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/tags_list/sources/dependency.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:main_api_client/api/user_api.dart';
import 'package:main_api_client/model/feedback_tags_list.dart';

@singleton
class TagsListNetworkRequest extends TagsListRequestDependency {
  TagsListNetworkRequest();

  @override
  Future<Response<FeedbackTagsList>> call() async {
    UserApi api = sl<MainApiProvider>().getUserApi();
    return await api.userGetfeedbacktagsGet();
  }
}
