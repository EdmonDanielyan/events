import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/announcements_detail/sources/network.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/setup.dart';
import 'announcements_detail_state.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/extensions/get_announcement_by_id.dart';

@injectable
class AnnouncementCubit extends Cubit<AnnouncementsDetailState> {
  AnnouncementCubit()
      : super(AnnouncementsDetailState(
            type: AnnouncementsDetailStateType.LOADING));

  Future<void> fetch(int announcementId) async {
    try {
      await Token.setNewTokensIfExpired();
      final _makeRequest = await getIt<AnnouncementsDetailNetworkRequest>(
          param1: announcementId)();
      emitSuccess(_makeRequest.mapResponse());
    } on DioError catch (e) {
      ErrorModel error = DioErrorHandler(e: e).call();

      emitError(error.msg);
      throw error.exception;
    } on Exception catch (_) {
      emitError(localizationInstance.errorOccurred);
      throw UnknownErrorException();
    }
  }

  void emitSuccess(AnnouncementData announcement) {
    emitState(type: AnnouncementsDetailStateType.LOADED, data: announcement);
  }

  void emitError(String errorMsg) {
    emitState(
      type: AnnouncementsDetailStateType.ERROR,
      errorMessage: errorMsg,
    );
  }

  void refresh() {
    emitState(type: AnnouncementsDetailStateType.LOADING);
  }

  void emitState(
      {required AnnouncementsDetailStateType type,
      AnnouncementData? data,
      String? errorMessage}) {
    emit(AnnouncementsDetailState(
        type: type, data: data, errorMessage: errorMessage));
  }
}
