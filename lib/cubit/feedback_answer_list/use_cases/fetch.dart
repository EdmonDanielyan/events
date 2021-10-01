import 'package:ink_mobile/cubit/feedback_answer_list/sources/dependency.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/feedback/management_answer.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/model/questions_list.dart';

class FeedbackAnswerListFetch {
  FeedbackAnswerListRequestDependency dependency;
  Pagination<ManagementAnswer> pagination;

  FeedbackAnswerListFetch({required this.pagination, required this.dependency});

  Future<Pagination<ManagementAnswer>> call() async {
    Response<QuestionsList> response = await dependency.makeRequest();

    return mapResponse(response);
  }

  Pagination<ManagementAnswer> mapResponse(Response<QuestionsList> response) {
    try {
      List<ManagementAnswer> items = [];

      response.data?.data.forEach((item) {
        items.add(
          ManagementAnswer(
              id: item.id,
              responsible: item.responsible,
              question: item.question,
              answer: item.answer),
        );

        if (pagination.next && item.next == null) pagination.next = false;
      });

      pagination = pagination.copyWith(items: items);

      pagination.pageNumber++;

      return pagination;
    } catch (_) {
      throw UnknownErrorException();
    }
  }
}
