import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/core/scrolling_loader/scroll_bottom_to_load.dart';
import 'package:ink_mobile/cubit/events_list/use_cases/fetch.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/errors.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:ink_mobile/models/token.dart';
import 'domain/repository.dart';
import 'events_list_state.dart';
import 'package:dio/dio.dart';

class EventsListCubit extends Cubit<EventsListState> {
  LanguageStrings languageStrings;

  Pagination<EventData> pagination = Pagination<EventData>(countOnPage: 5);
  ScrollBottomToLoad scrollBottomToLoad = ScrollBottomToLoad();

  EventsListCubit({required this.languageStrings})
      : super(EventsListState(type: EventsListStateType.LOADING));

  Future<void> fetch() async {
    try {
      if (pagination.next) {
        await Token.setNewTokensIfExpired();
        Pagination<EventData> response = await EventListFetch(
          pagination: pagination,
          dependency:
              EventListRepository(pagination: pagination).getDependency(),
        ).call();
        pagination = response;

        emitSuccess(pagination.items);
      }
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

  void resetProperties() {
    pagination.clear();
    scrollBottomToLoad.clear();
  }

  void refresh() {
    resetProperties();
    emitState(type: EventsListStateType.LOADING);
  }

  void emitSuccess(List<EventData> items) {
    emitState(type: EventsListStateType.LOADED, data: items);
  }

  void emitError(String errorMsg) {
    emitState(type: EventsListStateType.ERROR, errorMessage: errorMsg);
  }

  void emitState(
      {required EventsListStateType type,
      List<EventData>? data,
      String? errorMessage}) {
    emit(EventsListState(type: type, data: data, errorMessage: errorMessage));
  }

  void onScroll(ScrollController controller) async {
    scrollBottomToLoad.setController(controller);

    scrollBottomToLoad.onScroll(() async {
      await fetch().then((value) {
        scrollBottomToLoad.isLoading = false;
      }).onError((error, stackTrace) {
        String message = error is NoConnectionException
            ? languageStrings.noConnectionError
            : languageStrings.unknownError;

        showErrorDialog(message);

        scrollBottomToLoad.isLoading = false;
      });
    });
  }
}
