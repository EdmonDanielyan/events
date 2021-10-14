import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/personnel_movements/personnel_movements_state.dart';
import 'package:ink_mobile/cubit/personnel_movements/use_cases/fetch.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/movements_data.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:dio/dio.dart';

import 'domain/repository.dart';

class PersonnelMovementsCubit extends Cubit<PersonnelMovementsState> {
  LanguageStrings languageStrings;
  PersonnelMovementsCubit({required this.languageStrings})
      : super(
            PersonnelMovementsState(type: PersonnelMovementsStateType.LOADING));

  Future<void> load() async {
    try {
      await Token.setNewTokensIfExpired();
      final response = await StaffMovementsFetch(
        dependency: StaffMovementsRepository().getDependency(),
      ).call();
      emitSuccess(response);
    } on DioError catch (e) {
      final _errorHandler =
          DioErrorHandler(e: e, languageStrings: languageStrings);
      if (_errorHandler.isEmpty()) {
        emitEmpty();
        return;
      }

      ErrorModel error = _errorHandler.call();
      throw error.exception;
    } on TimeoutException catch (_) {
      emitError(languageStrings.noConnectionError);
      throw NoConnectionException();
    } on Exception catch (_) {
      emitError(languageStrings.errorOccurred);
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
