import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/events_list/sources/network.dart';
import 'package:ink_mobile/cubit/main_page/events_list_state.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/event_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/setup.dart';
import 'package:ink_mobile/extensions/get_events.dart';

@injectable
class MainEventsListCubit extends Cubit<EventsListState> {
  static List<EventData>? eventList;
  MainEventsListCubit()
      : super(EventsListState(type: EventsListStateType.LOADING));

  Pagination<EventData> pagination =
      Pagination<EventData>(countOnPage: 5, pageNumber: 1);

  Future<void> fetchEvents() async {
    try {
      if (eventList == null) {
        await Token.setNewTokensIfExpired();
        final response =
            await getIt<EventsListNetworkRequest>(param1: pagination)();
        final mapResponse = response.mapResponse(pagination);
        emitSuccess(mapResponse.items);
      } else {
        emitSuccess(eventList!);
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

  void emitSuccess(List<EventData> items) {
    emitState(type: EventsListStateType.LOADED, data: items);
  }

  void refresh() {
    emitState(type: EventsListStateType.LOADING);
  }

  void emitError(String errorMsg) {
    emitState(
      type: EventsListStateType.ERROR,
      errorMessage: errorMsg,
    );
  }

  void emitState(
      {required EventsListStateType type,
      List<EventData>? data,
      String? errorMessage}) {
    emit(EventsListState(type: type, data: data, errorMessage: errorMessage));
  }
}
