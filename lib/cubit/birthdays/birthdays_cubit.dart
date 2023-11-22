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
import 'package:ink_mobile/utils/date_comparison_util.dart';

@LazySingleton()
class BirthdaysCubit extends Cubit<BirthdaysState> {
  BirthdaysCubit() : super(BirthdaysState(type: BirthdaysStateType.LOADING));

  List<BirthdayData>? firstDayBirthdays;
  List<BirthdayData>? secondDayBirthdays;
  List<BirthdayData>? thirdDayBirthdays;

  Future<void> load() async {
    try {
      await Token.setNewTokensIfExpired();
      final response = await getIt<BirthdaysNetworkRequest>()();
      final mapResponse = response.mapResponse();
      sortBirthdays(mapResponse.birthdaysOther);
      emitSuccess(mapResponse.birthdaysToday, mapResponse.birthdaysOther);
    } on DioException catch (e) {
      final _errorHandler = DioErrorHandler(e: e);

      if (_errorHandler.isEmpty()) {
        _emitEmpty();
        return;
      }

      ErrorModel error = _errorHandler.call();
      _emitError(error.msg);
      // throw error.exception;
    }
  }

  void emitSuccess(
      List<BirthdayData> birthdaysToday, List<BirthdayData> birthdaysOther) {
    emit(
      BirthdaysState(
        type: BirthdaysStateType.LOADED,
        birthdaysToday: birthdaysToday,
        birthdaysOther: birthdaysOther,
        firstDayBirthdays: firstDayBirthdays,
        secondDayBirthdays: secondDayBirthdays,
        thirdDayBirthdays: thirdDayBirthdays,
      ),
    );
  }

  void _emitEmpty() {
    _emitState(
      type: BirthdaysStateType.EMPTY,
    );
  }

  void _emitError(String errorMsg) {
    _emitState(type: BirthdaysStateType.ERROR, errorMessage: errorMsg);
  }

  void _emitState({
    required BirthdaysStateType type,
    List<BirthdayData>? birthdaysToday,
    List<BirthdayData>? birthdaysOther,
    String? errorMessage,
  }) {
    emit(BirthdaysState(
      type: type,
      birthdaysToday: birthdaysToday,
      birthdaysOther: birthdaysOther,
      errorMessage: errorMessage,
    ));
  }

  void refresh() {
    emit(BirthdaysState(type: BirthdaysStateType.LOADING));
  }

  void sortBirthdays(List<BirthdayData> birthdays) {
    List<DateTime?> birthdaysDates = birthdays.map((e) => e.birthday).toList();
    if (birthdaysDates.every((birthdaysDate) => birthdaysDate != null)) {
      final minBirthdayDate = birthdaysDates.reduce((current, next) =>
          DateOnlyCompare().compareDateWithoutYear(current!, next!)
              ? current
              : next)!;
      firstDayBirthdays = birthdays
          .where((birthday) => DateOnlyCompare()
              .isSameDateWithoutYear(birthday.birthday!, minBirthdayDate))
          .toList();
      secondDayBirthdays = birthdays
          .where((birthday) => DateOnlyCompare().isSameDateWithoutYear(
              birthday.birthday!, minBirthdayDate.add(Duration(days: 1))))
          .toList();
      thirdDayBirthdays = birthdays
          .where((birthday) => DateOnlyCompare().isSameDateWithoutYear(
              birthday.birthday!, minBirthdayDate.add(Duration(days: 2))))
          .toList();
    }
  }

  bool get hasBirthdaysSoon =>
      state.firstDayBirthdays != null ||
      state.secondDayBirthdays != null ||
      state.thirdDayBirthdays != null;
}
