import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/cubit/btn/btn_state.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/send_medical_ins_form/sources/network.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/screens/medical_insurance/components/form/entities.dart';
import 'package:ink_mobile/setup.dart';

@singleton
class SendMedicalInsFormCubit extends Cubit<BtnCubitState> {
  SendMedicalInsFormCubit()
      : super(BtnCubitState(state: BtnCubitStateEnums.INITIAL));

  Future<bool> send({required MedicalInsuranceFormEntities entities}) async {
    emitState(newState: BtnCubitStateEnums.SENDING);

    try {
      await Token.setNewTokensIfExpired();
      final res =
          await sl<SendMedicalInsFormNetworkRequest>(param1: entities)();

      res.data!.success
          ? emitSuccess(res.data!.data)
          : emitError(res.data!.data);

      return res.data!.success;
    } on DioError catch (e) {
      ErrorModel error = DioErrorHandler(e: e).call();

      emitError(error.msg);
    } catch (_) {
      emitError(localizationInstance.errorOccurred);
    }

    return false;
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
