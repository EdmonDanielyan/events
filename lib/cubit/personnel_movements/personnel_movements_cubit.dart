import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/cubit/personnel_movements/personnel_movements_state.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/error_response.dart';
import 'package:ink_mobile/models/movements_data.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/api/user_api.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/model/movements_success.dart';

class PersonnelMovementsCubit extends Cubit<PersonnelMovementsState> {
  static UserApi userApi = MainApiClient().getUserApi();

  PersonnelMovementsCubit(): super(PersonnelMovementsState(
      type: PersonnelMovementsStateType.LOADING
  ));

  Future<void> load() async {
    try {
      await Token.setNewTokensIfExpired();

      Response<MovementsSuccess> response = await userApi
          .userMovementsGet().timeout(Duration(seconds: 4));

      List<MovementsData> movementsData = [];

      response.data?.data.forEach((movement) {
        movementsData.add(
          MovementsData(
              period: movement.period,
              position: movement.position,
              department: movement.department,
              organization: movement.organization,
              operation: movement.operation,
              pnum: movement.pnum
          )
        );
      });

      emit(PersonnelMovementsState(
          type: PersonnelMovementsStateType.LOADED,
          data: movementsData
      ));
    } on DioError catch (e) {

      switch (e.type) {
        case DioErrorType.response: {
          ErrorResponse errorResponse = ErrorResponse.fromException(e);

          if (errorResponse.code == 'QMA-33') {
            emitState(
                type: PersonnelMovementsStateType.EMPTY
            );
          } else {
            emitState(
                type: PersonnelMovementsStateType.ERROR,
                errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
            );
          }
          break;
        }

        case DioErrorType.other: {
          emitState(
              type: PersonnelMovementsStateType.ERROR,
              errorMessage: ErrorMessages.NO_CONNECTION_ERROR_MESSAGE
          );

          throw NoConnectionException();
        }

        default: {
          emitState(
              type: PersonnelMovementsStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );

          break;
        }
      }
    } on TimeoutException catch (e) {
      emitState(
          type: PersonnelMovementsStateType.ERROR,
          errorMessage: ErrorMessages.NO_CONNECTION_ERROR_MESSAGE
      );

      throw NoConnectionException();
    } on Exception catch (e) {
      emitState(
          type: PersonnelMovementsStateType.ERROR,
          errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
      );
    }
  }

  void refresh() {
    emitState(
        type: PersonnelMovementsStateType.LOADING
    );
  }

  void emitState({
    required PersonnelMovementsStateType type,
    List<MovementsData>? data,
    String? errorMessage
  }) {
    emit(PersonnelMovementsState(
        type: type,
        data: data,
        errorMessage: errorMessage
    ));
  }
}