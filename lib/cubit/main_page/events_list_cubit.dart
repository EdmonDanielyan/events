import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/cubit/main_page/events_list_state.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/error_response.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/api/events_api.dart';

class EventsListCubit extends Cubit<EventsListState> {
  static List<EventData>? eventsList;
  EventsListCubit() : super(EventsListState(type: EventsListStateType.LOADING));

  Future<void> fetchEvents() async {
    try {
      await Token.setNewTokensIfExpired();
      if (eventsList == null) {

        MainApiClient api = MainApiClient();
        EventsApi eventsApi = api.getEventsApi();

        final _response = await eventsApi.getEvents(
            pageNumber: 1,
            countOnPage: 5
        );
        final eventsDataMap = _response.data?.data.asMap;

        if (eventsDataMap != null && eventsDataMap.isNotEmpty) {
          eventsList = EventData.getListFromResponse(eventsDataMap['events']);

          emitState(
              type: EventsListStateType.LOADED,
              data: eventsList
          );
        } else {
          emitState(
              type: EventsListStateType.ERROR,
              errorMessage: ErrorMessages.NO_CONNECTION_ERROR_MESSAGE
          );
          throw NoConnectionException();
        }

      } else {
        emitState(
            type: EventsListStateType.LOADED,
            data: eventsList
        );
      }

    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        ErrorResponse response = ErrorResponse.fromException(e);

        if (response.code == 'QMA-6') {
          emitState(
              type: EventsListStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );
          throw InvalidRefreshTokenException();
        } else {
          emitState(
              type: EventsListStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );
          throw UnknownErrorException();
        }
      } else {
        emitState(
            type: EventsListStateType.ERROR,
            errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
        );
      }

    } on Exception catch (e) {
      emitState(
        type: EventsListStateType.ERROR,
        errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
      );
      throw UnknownErrorException();
    }
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

}