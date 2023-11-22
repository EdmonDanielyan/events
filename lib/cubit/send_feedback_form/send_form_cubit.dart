import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/cubit/btn/btn_state.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/send_feedback_form/sources/network.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/screens/feedback/components/form/entities.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/setup.dart';

@singleton
class SendManagementFormCubit extends Cubit<BtnCubitState> {
  SendManagementFormCubit()
      : super(BtnCubitState(state: BtnCubitStateEnums.INITIAL));

  Future<void> send(ManagementFeedbackFormEntities entities) async {
    emitState(newState: BtnCubitStateEnums.SENDING);

    try {
      await Token.setNewTokensIfExpired();
      final bool res =
          await getIt<SendFeedbackFormNetworkRequest>(param1: entities)();

      res
          ? emitSuccess(localizationInstance.feedbackSuccessfullySent)
          : emitError(localizationInstance.requiredParamsAreNotFilled);
    } on DioException catch (e) {
      ErrorModel error = DioErrorHandler(e: e).call();

      emitError(error.msg);
    } on Exception catch (_) {
      emitError(localizationInstance.errorOccurred);
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
