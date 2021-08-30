import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/errors.dart';
import 'package:ink_mobile/models/error_response.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/api/announcements_api.dart';
import 'package:main_api_client/model/get_announcements.dart';
import 'announcements_list_state.dart';
import 'package:dio/dio.dart';

class AnnouncementsListCubit extends Cubit<AnnouncementsListState>
{
  static AnnouncementsApi announcementsApi =
    MainApiClient().getAnnouncementsApi();

  static const int COUNT = 5;
  static const int BOTTOM_SCROLL_OFFSET = 300;

  int pageNumber = 1;
  bool isLastPage = false;
  bool isLoading = false;
  double loadedHeight = 0.0;
  List<AnnouncementData> announcementsList = [];

  AnnouncementsListCubit(): super(AnnouncementsListState(
      type: AnnouncementsListStateType.LOADING
  ));

  Future<void> fetch() async {
    try {
      if (!isLastPage) {
        await Token.setNewTokensIfExpired();

        Response<GetAnnouncements> response =
          await announcementsApi.getAnnouncements(
              countOnPage: COUNT,
              pageNumber: pageNumber
          );

        Map? announcementsListData = response.data?.data.asMap;

        if (announcementsListData != null) {
          announcementsList.addAll(
              AnnouncementData
                  .getListFromMap(announcementsListData['announcements'])
          );

          if (announcementsListData['next'] == null) {
            isLastPage = true;
          } else {
            pageNumber++;
          }

          emit(AnnouncementsListState(
              type: AnnouncementsListStateType.LOADED,
              data: announcementsList
          ));
        } else {
          emitState(
              type: AnnouncementsListStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );

          throw UnknownErrorException();
        }
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        ErrorResponse response = ErrorResponse
            .fromException(e);

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
            errorMessage: ErrorMessages.NO_CONNECTION_ERROR_MESSAGE
        );

        throw NoConnectionException();
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

  void resetProperties() {
    pageNumber = 1;
    announcementsList = [];
    isLastPage = false;
    isLoading = false;
    loadedHeight = 0.0;
  }

  void refresh() {
    resetProperties();
    emit(AnnouncementsListState(type: AnnouncementsListStateType.LOADING));
  }

  Future<void> onScroll(ScrollController controller) async {
    bool reachedLoadTrigger =
        controller.offset
            >= controller.position.maxScrollExtent
            - BOTTOM_SCROLL_OFFSET;

    bool wasNotLoadedAlready = controller.offset > loadedHeight;

    if (
    reachedLoadTrigger
        && wasNotLoadedAlready
        && !controller.position.outOfRange
        && !isLoading
    ) {
      isLoading = true;
      loadedHeight = controller.position.maxScrollExtent;

      await
        fetch()
          .then((value) {
            isLoading = false;
          })
          .onError((error, stackTrace) {
            String message;

            if (error is NoConnectionException) {
              message = ErrorMessages.NO_CONNECTION_ERROR_MESSAGE;
            } else {
              message = ErrorMessages.UNKNOWN_ERROR_MESSAGE;
            }

            showErrorDialog(message);

            isLoading = false;
          });
    }
  }
}