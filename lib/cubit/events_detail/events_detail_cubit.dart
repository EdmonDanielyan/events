import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/events_detail/domain/invite_repository.dart';
import 'package:ink_mobile/cubit/events_detail/events_detail_state.dart';
import 'package:ink_mobile/cubit/events_detail/use_cases/fetch.dart';
import 'package:ink_mobile/cubit/events_detail/use_cases/invite.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:dio/dio.dart';

import 'domain/fetch_repository.dart';

class EventDetailCubit extends Cubit<EventsDetailState> {
  LanguageStrings languageStrings;
  EventDetailCubit({required this.languageStrings})
      : super(EventsDetailState(type: EventsDetailStateType.LOADING));

  Future<void> load(int eventId) async {
    EventsDetailState(type: EventsDetailStateType.LOADING);

    try {
      await Token.setNewTokensIfExpired();
      EventData eventData = await EventDetailFetch(
        dependency: EventsDetailRepository(eventId: eventId).getDependency(),
      ).call();
      emitSuccess(eventData);
    } on DioError catch (e) {
      ErrorModel error =
          DioErrorHandler(e: e, languageStrings: languageStrings).call();

      emitError(error.msg);
      throw error.exception;
    } on Exception catch (_) {
      emitError(languageStrings.errorOccurred);
      throw UnknownErrorException();
    }
  }

  Future<void> invite(int eventId) async {
    try {
      emitSuccess(state.data!.copyWith(isMember: !state.data!.isMember!));
      await Token.setNewTokensIfExpired();
      await EventInvite(
        dependency: EventsInviteRepository(eventId: eventId).getDependency(),
      ).invite();
    } on DioError catch (e) {
      ErrorModel error =
          DioErrorHandler(e: e, languageStrings: languageStrings).call();

      emitError(error.msg);
      throw error.exception;
    } on Exception catch (_) {
      emitError(languageStrings.errorOccurred);
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
