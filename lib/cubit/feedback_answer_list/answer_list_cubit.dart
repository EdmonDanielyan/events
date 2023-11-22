import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/feedback_answer_list/sources/network.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/feedback/management_answer.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/setup.dart';
import 'package:ink_mobile/extensions/question_list.dart';

import 'answer_list_state.dart';

@injectable
class FeedbackAnswerListCubit extends Cubit<FeedbackAnswerListCubitState> {
  FeedbackAnswerListCubit()
      : super(FeedbackAnswerListCubitState(
            state: FeedbackAnswerListCubitStateEnums.LOADING));

  Pagination<ManagementAnswer> pagination =
      Pagination<ManagementAnswer>(countOnPage: 2);

  Future<void> fetch() async {
    try {
      if (pagination.next) {
        await Token.setNewTokensIfExpired();
        final response =
            await getIt<FeedbackAnswerListNetworkRequest>(param1: pagination)();
        pagination = response.mapResponse(pagination);
        emitSuccess(pagination.items);
      }
    } on DioException catch (e) {
      ErrorModel error = DioErrorHandler(e: e).call();
      emitError(error.msg);
      throw error.exception;
    } on Exception catch (_) {
      emitError(localizationInstance.errorOccurred);
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
