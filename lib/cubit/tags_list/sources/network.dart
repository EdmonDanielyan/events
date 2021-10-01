import 'package:dio/src/response.dart';
import 'package:ink_mobile/cubit/tags_list/sources/dependency.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/api/user_api.dart';
import 'package:main_api_client/model/feedback_tags_list.dart';

class TagsListNetworkRequest extends TagsListRequestDependency {
  TagsListNetworkRequest();

  @override
  Future<Response<FeedbackTagsList>> makeRequest() async {
    UserApi api = MainApiClient().getUserApi();
    return await api.userGetfeedbacktagsGet();
  }
}
