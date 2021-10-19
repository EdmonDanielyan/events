import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/core/cubit/btn/btn_state.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/send_reference_form/domain/send_form.dart';
import 'package:ink_mobile/cubit/send_reference_form/use_cases/send_form.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/references/delivery_list.dart';
import 'package:ink_mobile/models/references/reference_list.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/screens/references/components/form/entities.dart';

class SendReferenceFormCubit extends Cubit<BtnCubitState> {
  SendReferenceFormCubit()
      : super(BtnCubitState(state: BtnCubitStateEnums.INITIAL));

  Future<void> send(
      {required ReferencesFormEntities entities,
      required ReferencesItem referencesItem,
      required DeliveryItem deliveryItem}) async {
    emitState(newState: BtnCubitStateEnums.SENDING);

    try {
      await Token.setNewTokensIfExpired();
      final res = await SendReferenceForm(
        dependency: SendReferenceFormRepository(
          entities: entities,
          referencesItem: referencesItem,
          deliveryItem: deliveryItem,
        ).getDependency(),
      ).call();

      res.data!.success
          ? emitSuccess(res.data!.data)
          : emitError(res.data!.data);
    } on DioError catch (e) {
      ErrorModel error = DioErrorHandler(e: e).call();

      emitError(error.msg);
    } catch (_) {
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
