import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

abstract class TagsListRequestDependency {
  Future<Response<FeedbackTagsList>> call();
}
