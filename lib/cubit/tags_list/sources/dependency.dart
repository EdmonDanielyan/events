// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports
import 'package:main_api_client/model/feedback_tags_list.dart';
import 'package:dio/dio.dart';

abstract class TagsListRequestDependency {
  Future<Response<FeedbackTagsList>> call();
}
