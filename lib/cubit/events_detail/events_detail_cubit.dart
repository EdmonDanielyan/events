import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/events_detail/events_detail_state.dart';
import 'package:ink_mobile/cubit/events_detail/sources/cancel/network.dart';
import 'package:ink_mobile/cubit/events_detail/sources/fetch/network.dart';
import 'package:ink_mobile/cubit/events_detail/sources/invite/network.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/setup.dart';
import 'package:ink_mobile/extensions/get_event_by_id.dart';

@injectable
class EventDetailCubit extends Cubit<EventsDetailState> {
  EventDetailCubit()
      : super(EventsDetailState(type: EventsDetailStateType.LOADING));

  Future<void> load(int eventId) async {
    EventsDetailState(type: EventsDetailStateType.LOADING);

    try {
      await Token.setNewTokensIfExpired();
      final response =
          await getIt<EventsDetailNetworkRequest>(param1: eventId)();
      emitSuccess(response.mapResponse());
    } on DioError catch (e) {
      ErrorModel error = DioErrorHandler(e: e).call();

      emitError(error.msg);
      throw error.exception;
    } on Exception catch (_) {
      emitError(localizationInstance.errorOccurred);
      throw UnknownErrorException();
    }
  }

  Future<void> changeParticipationStatus(int eventId) async {
    try {
      if (state.data != null && state.data!.isMember != null) {
        await Token.setNewTokensIfExpired();
        if (state.data!.isMember!) {
          await getIt<EventCancelNetworkRequest>(param1: eventId).call();
        } else {
          await getIt<EventInviteNetworkRequest>(param1: eventId).call();
        }
        emitSuccess(state.data!.copyWith(isMember: !state.data!.isMember!));
      }
    } on DioError catch (e) {
      ErrorModel error = DioErrorHandler(e: e).call();
      emitError(error.msg);
      throw error.exception;
    } on Exception catch (_) {
      emitError(localizationInstance.errorOccurred);
      throw UnknownErrorException();
    }
  }

  void emitSuccess(EventData event) {
    emitState(type: EventsDetailStateType.LOADED, data: event);
  }

  void emitError(String errorMsg) {
    emitState(type: EventsDetailStateType.ERROR, errorMessage: errorMsg);
  }

  void emitState(
      {required EventsDetailStateType type,
      EventData? data,
      String? errorMessage}) {
    emit(EventsDetailState(type: type, data: data, errorMessage: errorMessage));
  }

  void refresh() {
    emitState(type: EventsDetailStateType.LOADING);
  }
}
