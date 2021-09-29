import 'package:dio/src/response.dart';
import 'package:ink_mobile/cubit/feedback_answer_list/sources/dependency.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/models/feedback/management_answer.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/api/user_api.dart';
import 'package:main_api_client/model/questions_list.dart';

class FeedbackAnswerListNetworkRequest
    extends FeedbackAnswerListRequestDependency {
  Pagination<ManagementAnswer> pagination;
  FeedbackAnswerListNetworkRequest({required this.pagination});

  @override
  Future<Response<QuestionsList>> makeRequest() async {
    UserApi newsApi = MainApiClient().getUserApi();
    return await newsApi.userGetquestionsGet(
        pageNumber: pagination.pageNumber, countOnPage: pagination.countOnPage);
  }
}
