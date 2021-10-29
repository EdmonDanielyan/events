import 'package:ink_mobile/models/feedback/management_answer.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/model/questions_list.dart';

abstract class FeedbackAnswerListRequestDependency {
  abstract Pagination<ManagementAnswer>? pagination;
  Future<Response<QuestionsList>> call();
}
