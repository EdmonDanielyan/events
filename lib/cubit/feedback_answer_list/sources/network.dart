// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports
import 'package:dio/src/response.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/feedback_answer_list/sources/dependency.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/models/feedback/management_answer.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:ink_mobile/providers/main_api.dart';
import 'package:ink_mobile/setup.dart';
import 'package:openapi/openapi.dart';


@injectable
class FeedbackAnswerListNetworkRequest
    extends FeedbackAnswerListRequestDependency {
  Pagination<ManagementAnswer>? pagination;
  FeedbackAnswerListNetworkRequest({@factoryParam required this.pagination})
      : assert(pagination != null);

  @override
  Future<Response<QuestionsList>> call() async {
    UserApi newsApi = getIt<MainApiProvider>().getUserApi();
    return await newsApi.userGetquestionsGet(
        pageNumber: pagination!.pageNumber,
        countOnPage: pagination!.countOnPage);
  }
}
