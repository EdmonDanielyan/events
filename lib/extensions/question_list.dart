// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports

import 'package:dio/dio.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/feedback/management_answer.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:openapi/openapi.dart';

extension QuestionsListExt on Response<QuestionsList> {
  Pagination<ManagementAnswer> mapResponse(
      Pagination<ManagementAnswer> pagination) {
    try {
      List<ManagementAnswer> items = [];

      this.data?.data.forEach((item) {
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
