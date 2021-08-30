import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/cubit/main_page/announcements_list_state.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:ink_mobile/models/error_response.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/api.dart';

class AnnouncementsListCubit extends Cubit<AnnouncementsListState> {
  static List<AnnouncementData>? announcementsList;
  AnnouncementsListCubit() : super(AnnouncementsListState(type: AnnouncementsListStateType.LOADING));

  Future<void> fetchAnnouncements() async {
    try {
      await Token.setNewTokensIfExpired();

      if (announcementsList == null) {
        var api = MainApiClient();
        var announcementsApi = api.getAnnouncementsApi();

        final _response = await announcementsApi.getAnnouncements(
            pageNumber: 1, countOnPage: 5);
        final announcementsDataMap = _response.data?.data.asMap;

        if (announcementsDataMap != null && announcementsDataMap.isNotEmpty) {
          announcementsList = AnnouncementData.getListFromMap(announcementsDataMap['announcements']);

          emitState(
              type: AnnouncementsListStateType.LOADED,
              data: announcementsList
          );
        } else {
          emitState(
              type: AnnouncementsListStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );
          throw UnknownErrorException();
        }

      } else {

        emitState(
            type: AnnouncementsListStateType.LOADED,
            data: announcementsList
        );
      }

    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        ErrorResponse response = ErrorResponse.fromException(e);

        if (response.code == 'QMA-6') {
          emitState(
              type: AnnouncementsListStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );
          throw InvalidRefreshTokenException();
        } else {
          emitState(
              type: AnnouncementsListStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );
          throw UnknownErrorException();
        }
      } else {
        emitState(
            type: AnnouncementsListStateType.ERROR,
            errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
        );
      }

    } on Exception catch (e) {
      emitState(
          type: AnnouncementsListStateType.ERROR,
          errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
      );
      throw UnknownErrorException();
    }
  }

  void emitState({
    required AnnouncementsListStateType type,
    List<AnnouncementData>? data,
    String? errorMessage
  }) {
    emit(AnnouncementsListState(
      type: type,
      data: data,
      errorMessage: errorMessage
    ));
  }

}