import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/core/cubit/btn/btn_state.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/send_feedback_form/domain/repository.dart';
import 'package:ink_mobile/cubit/send_feedback_form/use_cases/send.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/screens/feedback/components/form/entities.dart';
import 'package:dio/dio.dart';

class SendManagementFormCubit extends Cubit<BtnCubitState> {
  final LanguageStrings languageStrings;
  SendManagementFormCubit({required this.languageStrings})
      : super(BtnCubitState(state: BtnCubitStateEnums.INITIAL));

  void send(ManagementFeedbackFormEntities entities) async {
    emitState(newState: BtnCubitStateEnums.SENDING);

    try {
      await Token.setNewTokensIfExpired();
      final bool res = await SendFeedbackForm(
              dependency: SendFeedbackFormRepository(entities: entities)
                  .getDependency())
          .call();

      res
          ? emitSuccess(languageStrings.feedbackSuccessfullySent)
          : emitError(languageStrings.requiredParamsAreNotFilled);
    } on DioError catch (e) {
      ErrorModel error =
          DioErrorHandler(e: e, languageStrings: languageStrings).call();

      emitError(error.msg);
    } on Exception catch (_) {
      emitError(languageStrings.errorOccuried);
    }
  }

  void emitSuccess(String msg) {
    emitState(
      newState: BtnCubitStateEnums.SUCCESS,
      message: msg,
    );
  }

  void emitError(String error) {
    emitState(
      newState: BtnCubitStateEnums.ERROR,
      message: error,
    );
  }

  void emitState({required BtnCubitStateEnums newState, message = ""}) {
    emit(state.copyWith(state: newState, message: message));
  }
}
