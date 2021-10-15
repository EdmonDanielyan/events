import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/search/use_cases/search.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/search/data.dart';
import 'package:ink_mobile/models/search/search_model.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/cubit/search/search_state.dart';
import 'package:dio/dio.dart';

import 'domain/repository.dart';

class SearchCubit extends Cubit<SearchState> {
  LanguageStrings languageStrings;
  SearchCubit({required this.languageStrings})
      : super(SearchState(type: SearchStateType.STARTING));

  Future<void> search(String query) async {
    emit(SearchState(type: SearchStateType.LOADING));
    try {
      await Token.setNewTokensIfExpired();

      SearchModel? response = await GlobalSearch(
        dependency: SearchRepository(query: query).getDependency(),
      ).call();
      if (response == null) {
        emitEmpty();
        return;
      }
      response.isEmpty() ? emitEmpty() : emitSuccess(response);
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

  void emitSuccess(SearchModel model) {
    emitState(
      type: SearchStateType.LOADED,
      users: model.usersList,
      announcements: model.announcementsList,
      events: model.eventsList,
      news: model.newsList,
    );
  }

  void emitEmpty() {
    emitState(type: SearchStateType.EMPTY);
  }

  void emitError(String errorMsg) {
    emitState(type: SearchStateType.ERROR, errorMessage: errorMsg);
  }

  void emitState(
      {required SearchStateType type,
      List<UsersSearchData>? users,
      List<NewsSearchData>? news,
      List<EventsSearchData>? events,
      List<AnnouncementsSearchData>? announcements,
      String? errorMessage}) {
    emit(SearchState(
        type: type,
        users: users,
        news: news,
        events: events,
        announcements: announcements,
        errorMessage: errorMessage));
  }

  void refresh() {
    emit(SearchState(type: SearchStateType.STARTING));
  }
}
