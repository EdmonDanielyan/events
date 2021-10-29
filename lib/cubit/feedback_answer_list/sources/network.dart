import 'package:dio/src/response.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/feedback_answer_list/sources/dependency.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/models/feedback/management_answer.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:main_api_client/api/user_api.dart';
import 'package:main_api_client/model/questions_list.dart';

@injectable
class FeedbackAnswerListNetworkRequest
    extends FeedbackAnswerListRequestDependency {
  Pagination<ManagementAnswer>? pagination;
  FeedbackAnswerListNetworkRequest({@factoryParam required this.pagination})
      : assert(pagination != null);

  @override
  Future<Response<QuestionsList>> call() async {
    UserApi newsApi = sl.get<MainApiProvider>().getUserApi();
    return await newsApi.userGetquestionsGet(
        pageNumber: pagination!.pageNumber,
        countOnPage: pagination!.countOnPage);
  }
}
