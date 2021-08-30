import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:ink_mobile/models/error_response.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/api/announcements_api.dart';
import 'announcements_detail_state.dart';
import 'package:dio/dio.dart';

class AnnouncementCubit extends Cubit<AnnouncementsDetailState> {
  AnnouncementCubit()
    : super(AnnouncementsDetailState(
      type: AnnouncementsDetailStateType.LOADING
    ));

  Future<void> fetch(int announcementId) async {
    try {
      await Token.setNewTokensIfExpired();

      MainApiClient api = MainApiClient();
      AnnouncementsApi announcementsApi = api.getAnnouncementsApi();

      final _response = await announcementsApi
          .getAnnouncementById(announcementId)
      ;

      final announcementData = _response.data?.data;

      if (announcementData != null) {
        AnnouncementData announcement =
          AnnouncementData.fromProperty(announcementData);

        emitState(
            type: AnnouncementsDetailStateType.LOADED,
            data: announcement
        );

      } else {
        emitState(
            type: AnnouncementsDetailStateType.ERROR,
            errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
        );
        throw UnknownErrorException();
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        ErrorResponse response =
          ErrorResponse.fromException(e);

        if (response.code == 'QMA-6') {
          emitState(
              type: AnnouncementsDetailStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );

          throw InvalidRefreshTokenException();
        } else {
          emitState(
              type: AnnouncementsDetailStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );

          throw UnknownErrorException();
        }
      } else {
        emitState(
            type: AnnouncementsDetailStateType.ERROR,
            errorMessage: ErrorMessages.NO_CONNECTION_ERROR_MESSAGE
        );

        throw NoConnectionException();
      }
    } on Exception catch (e) {
      emitState(
          type: AnnouncementsDetailStateType.ERROR,
          errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
      );

      throw UnknownErrorException();
    }
  }

  void refresh() {
    emitState(type: AnnouncementsDetailStateType.LOADING);
  }

  void emitState({
    required AnnouncementsDetailStateType type,
    AnnouncementData? data,
    String? errorMessage
  }) {
    emit(AnnouncementsDetailState(
        type: type,
        data: data,
        errorMessage: errorMessage
    ));
  }
}