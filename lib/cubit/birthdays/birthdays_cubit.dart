import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/core/errors/empty_error_handler.dart';
import 'package:ink_mobile/cubit/birthdays/birthdays_state.dart';
import 'package:ink_mobile/cubit/birthdays/use_cases/fetch.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/birthday_data.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:dio/dio.dart';

import 'domain/repository.dart';

class BirthdaysCubit extends Cubit<BirthdaysState> {
  LanguageStrings languageStrings;
  BirthdaysCubit({required this.languageStrings})
      : super(BirthdaysState(type: BirthdaysStateType.LOADING));

  Future<void> load() async {
    try {
      await Token.setNewTokensIfExpired();
      final response = await BirthdaysFetch(
        dependency: BirthdaysRepository().getDependency(),
      ).call();

      emitSuccess(response.birthdaysToday, response.birthdaysOther);
    } on DioError catch (e) {
      bool isEmpty = DioEmptyHandler(e: e).isEmpty();
      if (isEmpty) {
        emitEmpty();
        return;
      }

      ErrorModel error =
          DioErrorHandler(e: e, languageStrings: languageStrings).call();
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
