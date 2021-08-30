import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/error_response.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/cubit/profile/profile_state.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/api/thank_api.dart';
import 'package:main_api_client/api/user_api.dart';
import 'package:main_api_client/model/get_user_success.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState(type: ProfileStateType.LOADING));
  static const String USER_NOT_FOUND = 'Пользователь не найден';

  Future<void> fetchUser(int? userId) async {

    try {
      await Token.setNewTokensIfExpired();

      MainApiClient api = MainApiClient();
      UserApi user = api.getUserApi();

      final Response<GetUserSuccess> response;

      if (userId == null) {
        response = await user.userGet();
      } else {
        response = await user.userIdGet(userId);
      }

      final Map? userDataMap = response.data?.data.asMap;

      if (userDataMap != null) {
        UserProfileData userData = UserProfileData
            .getUserFromResponse(userDataMap);

        JwtPayload? authUser = await Token.getJwtPayloadObject();

        if (userId == null || authUser != null && authUser.userId == userId) {
          emitState(
              type: ProfileStateType.LOADED,
              data: userData
          );
        } else {
          emitState(
              type: ProfileStateType.OTHER_USER_LOADED,
              data: userData
          );
        }
        
      } else {
        emitState(
            type: ProfileStateType.ERROR,
            errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
        );
        throw UnknownErrorException();
      }

    } on DioError catch (e) {
      print(e);
      if (e.type == DioErrorType.response) {
        ErrorResponse response = ErrorResponse.fromException(e);

        print(response.code);
        switch (response.code) {
          case 'QMA-6': {
            emitState(
                type: ProfileStateType.ERROR,
                errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
            );
            throw InvalidRefreshTokenException();
          }

          case 'QMA-15': {
            emitState(
                type: ProfileStateType.ERROR,
                errorMessage: USER_NOT_FOUND
            );
            throw UnknownErrorException(
              message: USER_NOT_FOUND
            );
          }

          default: {
            emitState(
                type: ProfileStateType.ERROR,
                errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
            );
            throw UnknownErrorException();
          }
        }
      } else {
        emitState(
            type: ProfileStateType.ERROR,
            errorMessage: ErrorMessages.NO_CONNECTION_ERROR_MESSAGE
        );
        throw NoConnectionException();
      }

    } on Exception catch (e) {
      emitState(
          type: ProfileStateType.ERROR,
          errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
      );
      throw UnknownErrorException();
    }
  }

  Future<void> thanks(userId) async {
    try {
      await Token.setNewTokensIfExpired();

      MainApiClient api = MainApiClient();
      ThankApi thank = api.getThankApi();

      await thank.thankIdGet(userId);

      this.fetchUser(userId);
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        ErrorResponse response = ErrorResponse.fromException(e);

        if (response.code == 'QMA-6') {
          emitState(
              type: ProfileStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );
          throw InvalidRefreshTokenException();
        } else {
          emitState(
              type: ProfileStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );
          throw UnknownErrorException();
        }
      } else {
        emitState(
            type: ProfileStateType.ERROR,
            errorMessage: ErrorMessages.NO_CONNECTION_ERROR_MESSAGE
        );
        throw NoConnectionException();
      }

    } on Exception catch (e) {
      emitState(
        type: ProfileStateType.ERROR,
        errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
      );
      throw UnknownErrorException();
    }
  }

  void refresh() {
    emitState(type: ProfileStateType.LOADING);
  }

  void emitState({
    required ProfileStateType type,
    UserProfileData? data,
    String? errorMessage
  }) {
    emit(ProfileState(
      type: type,
      data: data,
      errorMessage: errorMessage
    ));
  }

}
