import 'package:main_api_client/model/feedback_tags_list.dart';
import 'package:dio/dio.dart';

abstract class TagsListRequestDependency {
  Future<Response<FeedbackTagsList>> makeRequest();
}
