import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/cubit/events_detail/events_detail_state.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/error_response.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:main_api_client/api.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/api/events_api.dart';
import 'package:main_api_client/model/event_property.dart';
import 'package:main_api_client/model/get_event_by_id.dart';

class EventDetailCubit extends Cubit<EventsDetailState>
{
  EventDetailCubit(): super (EventsDetailState(type: EventsDetailStateType.LOADING));

  Future<void> load(int eventId) async {
    EventsDetailState(type: EventsDetailStateType.LOADING);

    try {
      await Token.setNewTokensIfExpired();
      MainApiClient api = MainApiClient();
      EventsApi eventApi = api.getEventsApi();
      Response<GetEventById> response = await eventApi.getEventById(eventId);
      EventProperty? responseData = response.data?.data;

      if (responseData != null) {
        EventData event = EventData.fromProperty(responseData);
        emitState(
            type: EventsDetailStateType.LOADED,
            data: event
        );
      } else {
        emitState(
          type: EventsDetailStateType.ERROR,
          errorMessage: ErrorMessages.UNKNOWN_ERROR_MESSAGE
        );
        throw UnknownErrorException();
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        ErrorResponse response = ErrorResponse.fromException(e);

        if (response.code == 'QMA-6') {
          emitState(
              type: EventsDetailStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );
          throw InvalidRefreshTokenException();
        } else {
          emitState(
              type: EventsDetailStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );
          throw UnknownErrorException();
        }
      } else {
        emitState(
            type: EventsDetailStateType.ERROR,
            errorMessage: ErrorMessages.NO_CONNECTION_ERROR_MESSAGE
        );
        throw NoConnectionException();
      }

    } on Exception catch (e) {
      emitState(
          type: EventsDetailStateType.ERROR,
          errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
      );
      throw UnknownErrorException();
    }
  }

  Future<void> invite(int eventId) async {
    try {
      await Token.setNewTokensIfExpired();
      MainApiClient api = MainApiClient();
      EventsApi eventApi = api.getEventsApi();

      await eventApi.eventsAddeventmemberIdGet(eventId);

      this.load(eventId);

    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        ErrorResponse response = ErrorResponse.fromException(e);

        if (response.code == 'QMA-6') {
          emitState(
              type: EventsDetailStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );
          throw InvalidRefreshTokenException();
        } else {
          emitState(
              type: EventsDetailStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );
          throw UnknownErrorException();
        }
      } else {
        emitState(
            type: EventsDetailStateType.ERROR,
            errorMessage: ErrorMessages.NO_CONNECTION_ERROR_MESSAGE
        );
        throw NoConnectionException();
      }

    } on Exception catch (e) {
      emitState(
          type: EventsDetailStateType.ERROR,
          errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
      );
      throw UnknownErrorException();
    }
  }

  void emitState({
    required EventsDetailStateType type,
    EventData? data,
    String? errorMessage
  }) {
    emit(EventsDetailState(
      type: type,
      data: data,
      errorMessage: errorMessage
    ));
  }

  void refresh() {
    emitState(type: EventsDetailStateType.LOADING);
  }
}