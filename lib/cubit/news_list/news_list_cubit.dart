import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/core/scrolling_loader/scroll_bottom_to_load.dart';
import 'package:ink_mobile/cubit/news_list/use_cases/fetch.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/errors.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:ink_mobile/models/token.dart';
import 'domain/repository.dart';
import 'news_list_state.dart';
import 'package:dio/dio.dart';

class NewsListCubit extends Cubit<NewsListState> {
  Pagination<NewsItemData> pagination =
      Pagination<NewsItemData>(countOnPage: 5);
  ScrollBottomToLoad scrollBottomToLoad = ScrollBottomToLoad();

  String filter = 'news';

  NewsListCubit() : super(NewsListState(type: NewsListStateType.LOADING));

  Future<void> fetch() async {
    try {
      if (pagination.next) {
        await Token.setNewTokensIfExpired();
        Pagination<NewsItemData> response = await NewsListFetch(
          pagination: pagination,
          dependency: NewsListRepository(pagination: pagination, filter: filter)
              .getDependency(),
        ).call();
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

  void resetProperties() {
    pagination.clear();
    scrollBottomToLoad.clear();
  }

  void refresh() {
    resetProperties();
    emit(NewsListState(type: NewsListStateType.LOADING));
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

  void emitSuccess(List<NewsItemData> items) {
    emitState(type: NewsListStateType.LOADED, data: items);
  }

  void emitError(String errorMsg) {
    emitState(type: NewsListStateType.ERROR, errorMessage: errorMsg);
  }

  emitState(
      {required NewsListStateType type,
      List<NewsItemData>? data,
      String? errorMessage}) {
    emit(NewsListState(type: type, data: data, errorMessage: errorMessage));
  }
}
