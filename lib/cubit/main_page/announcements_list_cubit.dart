import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/announcements_list/sources/network.dart';
import 'package:ink_mobile/cubit/main_page/announcements_list_state.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/setup.dart';
import 'package:ink_mobile/extensions/get_announcements.dart';

@singleton
class MainAnnouncementsListCubit extends Cubit<AnnouncementsListState> {
  static List<AnnouncementData>? announcementsList;
  MainAnnouncementsListCubit()
      : super(AnnouncementsListState(type: AnnouncementsListStateType.LOADING));

  Pagination<AnnouncementData> pagination =
      Pagination<AnnouncementData>(countOnPage: 5, pageNumber: 1);

  Future<void> fetchAnnouncements() async {
    try {
      if (announcementsList == null) {
        await Token.setNewTokensIfExpired();
        final response =
            await getIt<AnnouncementsListNetworkRequest>(param1: pagination)();
        final mapResponse = response.mapResponse(pagination);
        emitSuccess(mapResponse.items);
      } else {
        emitSuccess(announcementsList!);
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

  void updateItem(AnnouncementData newItem) {
    if (state.data != null) {
      List<AnnouncementData> items = [];
      for (final item in state.data!) {
        if (item.id == newItem.id) {
          items.add(newItem);
        } else {
          items.add(item);
        }
      }
      emitSuccess(items);
    }
  }

  void refresh() {
    emitState(type: AnnouncementsListStateType.LOADING);
  }

  void emitSuccess(List<AnnouncementData> items) {
    emitState(type: AnnouncementsListStateType.LOADED, data: items);
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
}
