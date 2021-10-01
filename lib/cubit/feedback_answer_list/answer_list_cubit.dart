import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/feedback_answer_list/domain/repository.dart';
import 'package:ink_mobile/cubit/feedback_answer_list/use_cases/fetch.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/feedback/management_answer.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/models/token.dart';

import 'answer_list_state.dart';

class FeedbackAnswerListCubit extends Cubit<FeedbackAnswerListCubitState> {
  final LanguageStrings languageStrings;
  FeedbackAnswerListCubit({required this.languageStrings})
      : super(FeedbackAnswerListCubitState(
            state: FeedbackAnswerListCubitStateEnums.LOADING));

  Pagination<ManagementAnswer> pagination =
      Pagination<ManagementAnswer>(countOnPage: 2);

  Future<void> fetch() async {
    try {
      if (pagination.next) {
        await Token.setNewTokensIfExpired();
        Pagination<ManagementAnswer> response = await FeedbackAnswerListFetch(
                pagination: pagination,
                dependency: FeedbackAnswerListRepository(pagination: pagination)
                    .getDependency())
            .call();
        pagination = response;
        emitSuccess(pagination.items);
      }
    } on DioError catch (e) {
      ErrorModel error =
          DioErrorHandler(e: e, languageStrings: languageStrings).call();
      emitError(error.msg);
      throw error.exception;
    } on Exception catch (_) {
      emitError(languageStrings.errorOccuried);
      throw UnknownErrorException();
    }
  }

  void emitSuccess(List<ManagementAnswer> answers) {
    emitState(
      newState: FeedbackAnswerListCubitStateEnums.SUCCESS,
      data: List<ManagementAnswer>.from(state.data)..addAll(answers),
    );
  }

  void emitError(String errorMsg) {
    emitState(
      newState: FeedbackAnswerListCubitStateEnums.ERROR,
      errorMessage: errorMsg,
    );
  }

  void emitState({
    required FeedbackAnswerListCubitStateEnums newState,
    List<ManagementAnswer>? data,
    errorMessage = "",
  }) {
    emit(state.copyWith(
        state: newState, data: data, errorMessage: errorMessage));
  }
}
