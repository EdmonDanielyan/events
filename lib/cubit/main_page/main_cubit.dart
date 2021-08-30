import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/cubit/main_page/announcements_list_cubit.dart';
import 'package:ink_mobile/cubit/main_page/events_list_cubit.dart';
import 'package:ink_mobile/cubit/main_page/main_state.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/error_response.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:dio/dio.dart';

class MainPageCubit extends Cubit<MainPageState>{
  MainPageCubit() : super(MainPageState(type: MainPageStateType.LOADING));

  Future<void> load() async {
    try {
      await Token.setNewTokensIfExpired();
      emit(MainPageState(type: MainPageStateType.LOADED));
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        ErrorResponse response = ErrorResponse.fromException(e);

        if (response.code == 'QMA-6') {
          emit(MainPageState(type: MainPageStateType.ERROR));
          throw InvalidRefreshTokenException();
        } else {
          emit(MainPageState(type: MainPageStateType.ERROR));
          throw UnknownErrorException();
        }
      } else {
        emit(MainPageState(type: MainPageStateType.ERROR));
        throw NoConnectionException();
      }

    } on Exception catch (e) {
      emit(MainPageState(type: MainPageStateType.ERROR));
      throw UnknownErrorException();
    }
  }

  void refresh() {
    EventsListCubit.eventsList = null;
    AnnouncementsListCubit.announcementsList = null;

    emit(MainPageState(type: MainPageStateType.LOADING));
  }

  void emitErrorState() {
    emit(MainPageState(
      type: MainPageStateType.ERROR,
      errorMessage: 'Отсутствует подключение к интернету'
    ));
  }
}