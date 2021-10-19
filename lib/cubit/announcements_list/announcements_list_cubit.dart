import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/core/scrolling_loader/scroll_bottom_to_load.dart';
import 'package:ink_mobile/cubit/announcements_list/use_cases/fetch.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/errors.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:ink_mobile/models/token.dart';
import 'announcements_list_state.dart';
import 'package:dio/dio.dart';

import 'domain/repository.dart';

class AnnouncementsListCubit extends Cubit<AnnouncementsListState> {
  Pagination<AnnouncementData> pagination =
      Pagination<AnnouncementData>(countOnPage: 5);
  ScrollBottomToLoad scrollBottomToLoad = ScrollBottomToLoad();

  AnnouncementsListCubit()
      : super(AnnouncementsListState(type: AnnouncementsListStateType.LOADING));

  Future<void> fetch() async {
    try {
      if (pagination.next) {
        await Token.setNewTokensIfExpired();
        Pagination<AnnouncementData> response = await AnnouncementsListFetch(
                pagination: pagination,
                dependency: AnnouncementListRepository(pagination: pagination)
                    .getDependency())
            .call();
        pagination = response;
        emitSuccess(pagination.items);
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

  void emitSuccess(List<AnnouncementData> announcementsList) {
    emit(AnnouncementsListState(
        type: AnnouncementsListStateType.LOADED, data: announcementsList));
  }

  void emitError(String errorMsg) {
    emitState(
      type: AnnouncementsListStateType.ERROR,
      errorMessage: errorMsg,
    );
  }

  void emitState(
      {required AnnouncementsListStateType type,
      List<AnnouncementData>? data,
      String? errorMessage}) {
    emit(AnnouncementsListState(
        type: type, data: data, errorMessage: errorMessage));
  }

  void resetProperties() {
    pagination.clear();
    scrollBottomToLoad.clear();
  }

  void refresh() {
    resetProperties();
    emit(AnnouncementsListState(type: AnnouncementsListStateType.LOADING));
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
