import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/core/scrolling_loader/scroll_bottom_to_load.dart';
import 'package:ink_mobile/cubit/events_list/sources/network.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/errors.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/setup.dart';
import 'events_list_state.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/extensions/get_events.dart';

@injectable
class EventsListCubit extends Cubit<EventsListState> {
  Pagination<EventData> pagination = Pagination<EventData>(countOnPage: 5);
  ScrollBottomToLoad scrollBottomToLoad = ScrollBottomToLoad();

  EventsListCubit()
      : super(const EventsListState(type: EventsListStateType.LOADING));

  Future<void> fetch() async {
    try {
      if (pagination.next) {
        await Token.setNewTokensIfExpired();
        final response =
            await getIt<EventsListNetworkRequest>(param1: pagination)();
        // pagination = response.mapResponse(pagination);
        print(response);
        emitSuccess(pagination.items);
      }
    } on DioException catch (e) {
      ErrorModel error = DioErrorHandler(e: e).call();

      emitError(error.msg);
      throw error.exception;
    } on Exception catch (_) {
      emitError(localizationInstance.errorOccurred);
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

  Future<void> onScroll(ScrollController controller) async {
    scrollBottomToLoad.setController(controller);

    scrollBottomToLoad.onScroll(() async {
      await fetch().then((value) {
        scrollBottomToLoad.isLoading = false;
      }).onError((error, stackTrace) {
        String message = error is NoConnectionException
            ? localizationInstance.noConnectionError
            : localizationInstance.unknownError;

        showErrorDialog(message);

        scrollBottomToLoad.isLoading = false;
      });
    });
  }
}
