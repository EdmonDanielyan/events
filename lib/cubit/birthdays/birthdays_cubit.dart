import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/cubit/birthdays/birthdays_state.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/birthday_data.dart';
import 'package:ink_mobile/models/error_response.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:main_api_client/api.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/api/user_api.dart';
import 'package:main_api_client/model/birthdays_success.dart';
import 'package:main_api_client/model/birthdays_success_data.dart';

class BirthdaysCubit extends Cubit<BirthdaysState>
{
  BirthdaysCubit() : super (BirthdaysState(type: BirthdaysStateType.LOADING));

  Future<void> load() async {
    try {
      await Token.setNewTokensIfExpired();
      MainApiClient api = MainApiClient();

      UserApi userApi = api.getUserApi();

      BirthdaysSuccessData? data;

      try {
        Response<BirthdaysSuccess> response = await userApi
            .userBirthdayGet()
            .timeout(Duration(seconds: 4));

        data = response.data?.data;
      } on DioError catch (e) {
        if (e.type == DioErrorType.response) {
          ErrorResponse response = ErrorResponse
              .fromException(e);

          if (response.code == 'QMA-32') {
            emitState(
              type: BirthdaysStateType.EMPTY,
            );
            return;
          }
        }

        emitState(
            type: BirthdaysStateType.ERROR,
            errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
        );
        return;
      } on Exception catch (e) {
        emitState(
            type: BirthdaysStateType.ERROR,
            errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
        );
        return;
      }

      if (data != null) {
        List<BirthdayData> birthdaysToday = [];
        List<BirthdayData> birthdaysOther = [];

        data.today.forEach((birthday) {
          birthdaysToday.add(BirthdayData.fromResponse(birthday));
        });

        data.others.forEach((birthday) {
          birthdaysOther.add(BirthdayData.fromResponse(birthday));
        });

        emit(BirthdaysState(type: BirthdaysStateType.LOADED,
            birthdaysToday: birthdaysToday,
            birthdaysOther: birthdaysOther
        ));

      } else {
        emitState(
            type: BirthdaysStateType.ERROR,
            errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
        );
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        ErrorResponse response = ErrorResponse.fromException(e);

        if (response.code == 'QMA-6') {

          emitState(
              type: BirthdaysStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );

          throw InvalidRefreshTokenException();

        } else if (response.code == 'QMA-32') {

          emitState(
              type: BirthdaysStateType.EMPTY
          );

        } else {

          emitState(
              type: BirthdaysStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );

          throw UnknownErrorException();
        }
      } else {

        emitState(
            type: BirthdaysStateType.ERROR,
            errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
        );

        throw NoConnectionException();

      }
    } on TimeoutException catch (e) {

      emitState(
          type: BirthdaysStateType.ERROR,
          errorMessage: ErrorMessages.NO_CONNECTION_ERROR_MESSAGE
      );

      throw NoConnectionException();

    } on Exception catch (e) {

      emitState(
          type: BirthdaysStateType.ERROR,
          errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
      );

      throw UnknownErrorException();

    }
  }

  void emitState({
    required BirthdaysStateType type,
    List<BirthdayData>? birthdaysToday,
    List<BirthdayData>? birthdaysOther,
    String? errorMessage
  }) {
    emit(BirthdaysState(
      type: type,
      birthdaysToday: birthdaysToday,
      birthdaysOther: birthdaysOther,
      errorMessage: errorMessage
    ));
  }

  void refresh() {
    emit(BirthdaysState(type: BirthdaysStateType.LOADING));
  }
}