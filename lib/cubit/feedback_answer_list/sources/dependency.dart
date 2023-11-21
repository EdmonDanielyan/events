// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports
import 'package:ink_mobile/models/feedback/management_answer.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

abstract class FeedbackAnswerListRequestDependency {
  abstract Pagination<ManagementAnswer>? pagination;
  Future<Response<QuestionsList>> call();
}
