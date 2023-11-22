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
      final response = await getIt<StaffMovementsNetworkRequest>()();
      emitSuccess(response.mapResponse());
    } on DioException catch (e) {
      final _errorHandler = DioErrorHandler(e: e);
      if (_errorHandler.isEmpty()) {
        emitEmpty();
        return;
      }

//TODO: возвращает 404 на верный запрос, если не было перемещний
// {
//     "success": false,
//     "host": "https://portal.irkutskoil.ru",
//     "version": "1.0.0",
//     "returned": "2023-11-21T06:27:40+0800",
//     "type": "about:blank",
//     "instance": "https://portal.irkutskoil.ru/api/v1/user/movements",
//     "title": "Кадровые перемещения не найдены",
//     "detail": "Для текущего пользователя не найдено ни одного кадрового перемещения",
//     "status": 404,
//     "code": "QMA-33"
// }
//надо это потестить и обработать нормально
// а сейчас пока что 
     emitEmpty();
      ErrorModel error = _errorHandler.call();
      // throw error.exception;
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
