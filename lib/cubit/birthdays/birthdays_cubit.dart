import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/birthdays/birthdays_state.dart';
import 'package:ink_mobile/cubit/birthdays/sources/network.dart';
import 'package:ink_mobile/models/birthday_data.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/setup.dart';

import 'package:ink_mobile/extensions/birthday_success.dart';

@injectable
class BirthdaysCubit extends Cubit<BirthdaysState> {
  BirthdaysCubit() : super(BirthdaysState(type: BirthdaysStateType.LOADING));

  Future<void> load() async {
    try {
      await Token.setNewTokensIfExpired();
      final response = await getIt<BirthdaysNetworkRequest>()();
      final mapResponse = response.mapResponse();
      emitSuccess(mapResponse.birthdaysToday, mapResponse.birthdaysOther);
    } on DioError catch (e) {
      final _errorHandler = DioErrorHandler(e: e);
      if (_errorHandler.isEmpty()) {
        emitEmpty();
        return;
      }

      ErrorModel error = _errorHandler.call();
      emitError(error.msg);
      throw error.exception;
    }
  }

  void emitSuccess(
      List<BirthdayData> birthdaysToday, List<BirthdayData> birthdaysOther) {
    emit(
      BirthdaysState(
        type: BirthdaysStateType.LOADED,
        birthdaysToday: birthdaysToday,
        birthdaysOther: birthdaysOther,
      ),
    );
  }

  void emitEmpty() {
    emitState(
      type: BirthdaysStateType.EMPTY,
    );
  }

  void emitError(String errorMsg) {
    emitState(type: BirthdaysStateType.ERROR, errorMessage: errorMsg);
  }

  void emitState(
      {required BirthdaysStateType type,
      List<BirthdayData>? birthdaysToday,
      List<BirthdayData>? birthdaysOther,
      String? errorMessage}) {
    emit(BirthdaysState(
        type: type,
        birthdaysToday: birthdaysToday,
        birthdaysOther: birthdaysOther,
        errorMessage: errorMessage));
  }

  void refresh() {
    emit(BirthdaysState(type: BirthdaysStateType.LOADING));
  }
}
