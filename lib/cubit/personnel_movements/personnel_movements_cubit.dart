import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/personnel_movements/personnel_movements_state.dart';
import 'package:ink_mobile/cubit/personnel_movements/sources/network.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/movements_data.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/setup.dart';
import 'package:ink_mobile/extensions/movement_success.dart';

@injectable
class PersonnelMovementsCubit extends Cubit<PersonnelMovementsState> {
  PersonnelMovementsCubit()
      : super(
            PersonnelMovementsState(type: PersonnelMovementsStateType.LOADING));

  Future<void> load() async {
    try {
      await Token.setNewTokensIfExpired();
      final response = await sl<StaffMovementsNetworkRequest>()();
      emitSuccess(response.mapResponse());
    } on DioError catch (e) {
      final _errorHandler = DioErrorHandler(e: e);
      if (_errorHandler.isEmpty()) {
        emitEmpty();
        return;
      }

      ErrorModel error = _errorHandler.call();
      throw error.exception;
    } on TimeoutException catch (_) {
      emitError(localizationInstance.noConnectionError);
      throw NoConnectionException();
    } on Exception catch (_) {
      emitError(localizationInstance.errorOccurred);
    }
  }

  void emitSuccess(List<MovementsData> items) {
    emit(PersonnelMovementsState(
        type: PersonnelMovementsStateType.LOADED, data: items));
  }

  void emitEmpty() {
    emitState(type: PersonnelMovementsStateType.EMPTY);
  }

  void emitError(String errorMsg) {
    emitState(type: PersonnelMovementsStateType.ERROR, errorMessage: errorMsg);
  }

  void refresh() {
    emitState(type: PersonnelMovementsStateType.LOADING);
  }

  void emitState(
      {required PersonnelMovementsStateType type,
      List<MovementsData>? data,
      String? errorMessage}) {
    emit(PersonnelMovementsState(
        type: type, data: data, errorMessage: errorMessage));
  }
}
