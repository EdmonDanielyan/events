import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/core/cubit/btn/btn_state.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/send_medical_ins_form/domain/send_form.dart';
import 'package:ink_mobile/cubit/send_medical_ins_form/use_cases/send_form.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/screens/medical_insurance/components/form/entities.dart';

class SendMedicalInsFormCubit extends Cubit<BtnCubitState> {
  final LanguageStrings languageStrings;
  SendMedicalInsFormCubit({required this.languageStrings})
      : super(BtnCubitState(state: BtnCubitStateEnums.INITIAL));

  void send({required MedicalInsuranceFormEntities entities}) async {
    emitState(newState: BtnCubitStateEnums.SENDING);

    try {
      final res = await SendMedicalInsForm(
        dependency: SendMedicalInsFormRepository(
          entities: entities,
        ).getDependency(),
      ).call();

      res.data!.success
          ? emitSuccess(res.data!.data)
          : emitError(res.data!.data);
    } on DioError catch (e) {
      ErrorModel error =
          DioErrorHandler(e: e, languageStrings: languageStrings).call();

      emitError(error.msg);
    } catch (_) {
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
