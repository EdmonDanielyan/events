import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/errors.dart';
import 'package:ink_mobile/models/error_response.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/api/events_api.dart';
import 'package:main_api_client/model/get_events.dart';
import 'events_list_state.dart';
import 'package:dio/dio.dart';

class EventsListCubit extends Cubit<EventsListState>
{
  static EventsApi eventsApi = MainApiClient().getEventsApi();
  static const int COUNT = 5;
  static const BOTTOM_SCROLL_OFFSET = 300;

  int pageNumber = 1;
  bool isLastPage = false;
  bool isLoading = false;
  double loadedHeight = 0.0;
  List<EventData> eventsList = [];

  EventsListCubit(): super(EventsListState(type: EventsListStateType.LOADING));

  Future<void> fetch() async {
    try {
      if (!isLastPage) {
        await Token.setNewTokensIfExpired();

        Response<GetEvents> response = await eventsApi.getEvents(countOnPage: COUNT, pageNumber: pageNumber);
        Map? eventsListData = response.data?.data.asMap;

        if (eventsListData != null) {
          eventsList.addAll(
              EventData.getListFromResponse(eventsListData['events'])
          );

          if (eventsListData['next'] == null) {
            isLastPage = true;
          } else {
            pageNumber++;
          }

          emitState(
              type: EventsListStateType.LOADED,
              data: eventsList
          );
        } else {
          emitState(
              type: EventsListStateType.ERROR,
              errorMessage: ErrorMessages.UNKNOWN_ERROR_MESSAGE
          );

          throw UnknownErrorException();
        }
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        ErrorResponse response = ErrorResponse.fromException(e);

        if (response.code == 'QMA-6') {
          emitState(
            type: EventsListStateType.ERROR,
            errorMessage: ErrorMessages.UNKNOWN_ERROR_MESSAGE
          );

          throw InvalidRefreshTokenException();
        } else {
          emitState(
              type: EventsListStateType.ERROR,
              errorMessage: ErrorMessages.UNKNOWN_ERROR_MESSAGE
          );

          throw UnknownErrorException();
        }
      } else {
        emitState(
            type: EventsListStateType.ERROR,
            errorMessage: ErrorMessages.NO_CONNECTION_ERROR_MESSAGE
        );

        throw NoConnectionException();
      }

    } on Exception catch (e) {
      emitState(
          type: EventsListStateType.ERROR,
          errorMessage: ErrorMessages.UNKNOWN_ERROR_MESSAGE
      );

      throw UnknownErrorException();
    }
  }

  void resetProperties() {
    pageNumber = 1;
    eventsList = [];
    isLastPage = false;
    isLoading = false;
    loadedHeight = 0.0;
  }

  void refresh() {
    resetProperties();
    emitState(type: EventsListStateType.LOADING);
  }

  void emitState({
    required EventsListStateType type,
    List<EventData>? data,
    String? errorMessage
  }) {
    emit(EventsListState(
        type: type,
        data: data,
        errorMessage: errorMessage
    ));
  }

  void onScroll(ScrollController controller) async {
    bool reachedLoadTrigger = controller.offset >=
        controller.position.maxScrollExtent - BOTTOM_SCROLL_OFFSET;
    bool wasNotLoadedAlready = controller.offset > loadedHeight;

    if (
    reachedLoadTrigger &&
        wasNotLoadedAlready &&
        !controller.position.outOfRange &&
        !isLoading
    ) {
      isLoading = true;
      loadedHeight = controller.position.maxScrollExtent;

      await fetch()
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

            showErrorDialog(
                message
            );
            isLoading = false;
          });
    }
  }
}