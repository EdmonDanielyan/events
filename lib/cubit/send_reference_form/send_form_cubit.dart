import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/cubit/btn/btn_state.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/send_reference_form/sources/network.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/references/delivery_list.dart';
import 'package:ink_mobile/models/references/reference_list.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/models/send_reference_form_entities.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/screens/references/components/form/entities.dart';
import 'package:ink_mobile/setup.dart';

@singleton
class SendReferenceFormCubit extends Cubit<BtnCubitState> {
  SendReferenceFormCubit()
      : super(BtnCubitState(state: BtnCubitStateEnums.INITIAL));

  Future<bool> send(
      {required ReferencesFormEntities entities,
      required ReferencesItem referencesItem,
      required DeliveryItem deliveryItem}) async {
    emitState(newState: BtnCubitStateEnums.SENDING);

    try {
      await Token.setNewTokensIfExpired();
      final formEntities = SendReferenceFormEntities(
          entities: entities,
          referencesItem: referencesItem,
          deliveryItem: deliveryItem);

      final res =
          await getIt<SendReferenceFormNetworkRequest>(param1: formEntities)();
      res.data!.success
          // ? emitSuccess(res.data!.data)
          // : emitError(res.data!.data);
          //TODO migration
          ? emitSuccess(res.data!.data!)
          : emitError(res.data!.data!);

      return res.data!.success;
    } on DioException catch (e) {
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
