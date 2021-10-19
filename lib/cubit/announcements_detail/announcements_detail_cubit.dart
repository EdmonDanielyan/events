import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/announcements_detail/use_cases/fetch.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/announcement_data.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/token.dart';
import 'announcements_detail_state.dart';
import 'package:dio/dio.dart';

import 'domain/repository.dart';

class AnnouncementCubit extends Cubit<AnnouncementsDetailState> {
  LanguageStrings languageStrings;
  AnnouncementCubit({required this.languageStrings})
      : super(AnnouncementsDetailState(
            type: AnnouncementsDetailStateType.LOADING));

  Future<void> fetch(int announcementId) async {
    try {
      await Token.setNewTokensIfExpired();
      AnnouncementData announcement = await AnnouncementDetailFetch(
        dependency:
            AnnouncementsDetailRepository(id: announcementId).getDependency(),
      ).call();
      emitSuccess(announcement);
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
