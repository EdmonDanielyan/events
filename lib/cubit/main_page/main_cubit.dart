import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/main_page/announcements_list_cubit.dart';
import 'package:ink_mobile/cubit/main_page/events_list_cubit.dart';
import 'package:ink_mobile/cubit/main_page/main_state.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:dio/dio.dart';

@injectable
class MainPageCubit extends Cubit<MainPageState> {
  MainPageCubit() : super(MainPageState(type: MainPageStateType.LOADING));

  Future<void> load() async {
    try {
      await Token.setNewTokensIfExpired();
      emit(MainPageState(type: MainPageStateType.LOADED));
    } on DioError catch (e) {
      ErrorModel error = DioErrorHandler(e: e).call();

      emitError();
      throw error.exception;
    } on Exception catch (_) {
      emitError();
      throw UnknownErrorException();
    }
  }

  void emitSuccess() {
    emit(MainPageState(type: MainPageStateType.LOADED));
  }

  void emitError() {
    emit(MainPageState(type: MainPageStateType.ERROR));
  }

  void refresh() {
    MainEventsListCubit.eventList = null;
    MainAnnouncementsListCubit.announcementsList = null;

    emit(MainPageState(type: MainPageStateType.LOADING));
  }

  void emitErrorState() {
    emit(MainPageState(
        type: MainPageStateType.ERROR,
        errorMessage: 'Отсутствует подключение к интернету'));
  }
}
