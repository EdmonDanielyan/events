import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/core/scrolling_loader/scroll_bottom_to_load.dart';
import 'package:ink_mobile/cubit/news_list/sources/network.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/errors.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/setup.dart';
import 'news_list_state.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/extensions/get_news.dart';

@singleton
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
        final response = await getIt<NewsListNetworkRequest>(
            param1: pagination, param2: filter)();
        pagination = response.mapResponse(pagination);

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

  void updateItem(NewsItemData newItem) {
    if (state.data != null) {
      List<NewsItemData> items = [];
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

  NewsItemData? getItem(NewsItemData newItem) {
    if (state.data != null) {
      for (final item in state.data!) {
        if (item.id == newItem.id) {
          return item;
        }
      }
    }

    return null;
  }

  void refresh() {
    resetProperties();
    emit(NewsListState(type: NewsListStateType.LOADING));
  }

  Future<void> onScroll(ScrollController controller) async {
    scrollBottomToLoad.setController(controller);
    scrollBottomToLoad.onScroll(() async {
      await fetch().then((value) {
        scrollBottomToLoad.clear();
      }).onError((error, stackTrace) {
        String message = error is NoConnectionException
            ? localizationInstance.noConnectionError
            : localizationInstance.unknownError;

        showErrorDialog(message);
        scrollBottomToLoad.clear();
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
