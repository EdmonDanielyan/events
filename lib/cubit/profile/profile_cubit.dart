import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/profile/domain/thank_repository.dart';
import 'package:ink_mobile/cubit/profile/use_cases/fetch.dart';
import 'package:ink_mobile/cubit/profile/use_cases/thank.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/cubit/profile/profile_state.dart';
import 'package:ink_mobile/models/user_data.dart';
import 'package:dio/dio.dart';

import 'domain/fetch_repository.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState(type: ProfileStateType.LOADING));

  Future<void> fetchUser(int? userId) async {
    try {
      await Token.setNewTokensIfExpired();
      UserProfileData userData = await ProfileFetch(
        dependency: ProfileFetchRepository(userId: userId).getDependency(),
      ).call();
      JwtPayload? authUser = await Token.getJwtPayloadObject();

      if (userId == null || authUser != null && authUser.userId == userId)
        emitSuccessUser(userData);
      else
        emitSuccessOtherUser(userData);
    } on DioError catch (e) {
      ErrorModel error = DioErrorHandler(e: e).call();
      emitError(error.msg);
      throw error.exception;
    } on Exception catch (_) {
      emitError(localizationInstance.errorOccurred);
      throw UnknownErrorException();
    }
  }

  Future<void> thanks(userId) async {
    try {
      emitSuccessOtherUser(state.data!.copyWith(
        canBeThanked: !state.data!.canBeThanked,
        votes: state.data!.votes!.copyWith(
          barrels: state.data!.votes!.barrels + 1,
        ),
      ));
      await Token.setNewTokensIfExpired();
      ProfileThank(
        dependency: ProfileThankRepository(userId: userId).getDependency(),
      ).thank();
    } on DioError catch (e) {
      ErrorModel error = DioErrorHandler(e: e).call();
      emitError(error.msg);
      throw error.exception;
    } on Exception catch (_) {
      emitError(localizationInstance.errorOccurred);
      throw UnknownErrorException();
    }
  }

  void emitSuccessOtherUser(UserProfileData data) {
    emitState(type: ProfileStateType.OTHER_USER_LOADED, data: data);
  }

  void emitSuccessUser(UserProfileData data) {
    emitState(type: ProfileStateType.LOADED, data: data);
  }

  void emitError(String errorMsg) {
    emitState(type: ProfileStateType.ERROR, errorMessage: errorMsg);
  }

  void refresh() {
    emitState(type: ProfileStateType.LOADING);
  }

  void emitState(
      {required ProfileStateType type,
      UserProfileData? data,
      String? errorMessage}) {
    emit(ProfileState(type: type, data: data, errorMessage: errorMessage));
  }
}
