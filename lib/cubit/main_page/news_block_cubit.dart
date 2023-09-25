import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/main_page/news_block_state.dart';
import 'package:ink_mobile/cubit/news_detail/sources/fetch/network.dart';
import 'package:ink_mobile/cubit/news_list/sources/network.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/extensions/get_news_by_id.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/setup.dart';
import 'package:ink_mobile/extensions/get_news.dart';

import '../../models/filter_item.dart';

Map<String, BetterPlayerController> mapCachedPlayerControllers = {};

@singleton
class NewsBlockCubit extends Cubit<NewsBlockState> {
  NewsBlockCubit() : super(NewsBlockState(type: NewsBlockStateType.LOADING));

  Pagination<NewsItemData> pagination =
      Pagination<NewsItemData>(countOnPage: 5);

  List<FilterItem> _tabs = [];

  List<FilterItem> _mapFilterItems(Map? tabsMap) {
    final List? tabsList = tabsMap?["tabs"];
    if (tabsList != null) {
      List<FilterItem> tabs = [];
      tabsList.forEach((element) {
        tabs.add(FilterItem.fromMap(element));
      });
      return tabs;
    } else {
      return [];
    }
  }

  Future<void> fetchNews() async {
    try {
      await Token.setNewTokensIfExpired();
      final response = await getIt<NewsListNetworkRequest>(
          param1: pagination, param2: "main")();
      _tabs = _mapFilterItems(response.data?.data.asMap);
      final mapResponse = response.mapResponse(pagination);
      emitSuccess(items: mapResponse.items, tabs: _tabs);
      for (var item in mapResponse.items) {
        final responseItemData =
            await getIt<NewsDetailNetworkRequest>(param1: item.id)();
        final responseItemVideoLinks =
            responseItemData.mapResponse().videoLinks;
        if (responseItemVideoLinks != null) {
          if (responseItemVideoLinks.isNotEmpty) {
            if (mapCachedPlayerControllers
                .containsKey(responseItemVideoLinks.first)) {
            } else {
              BetterPlayerDataSource dataSource = BetterPlayerDataSource(
                  BetterPlayerDataSourceType.network,
                  responseItemVideoLinks.first,
                  cacheConfiguration: BetterPlayerCacheConfiguration(
                      useCache: true,
                      maxCacheFileSize: 7 * 1024 * 1024,
                      maxCacheSize: 7 * 1024 * 1024),
                  bufferingConfiguration: BetterPlayerBufferingConfiguration(
                      maxBufferMs: 200000,
                      bufferForPlaybackAfterRebufferMs: 25000));

              BetterPlayerController _controller = BetterPlayerController(
                  BetterPlayerConfiguration(
                    deviceOrientationsAfterFullScreen: [
                      DeviceOrientation.portraitDown,
                      DeviceOrientation.portraitUp
                    ],
                    controlsConfiguration: BetterPlayerControlsConfiguration(
                      playerTheme: BetterPlayerTheme.material,
                      enableSkips: false,
                    ),
                    fit: BoxFit.contain,
                  ),
                  betterPlayerDataSource: dataSource);
              mapCachedPlayerControllers['${responseItemVideoLinks.first}'] =
                  _controller;
            }
          }
        }
      }
    } on DioError catch (e) {
      ErrorModel error = DioErrorHandler(e: e).call();

      emitError(error.msg);
    } on Exception catch (_) {
      emitError(localizationInstance.errorOccurred);
      throw UnknownErrorException();
    }
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
      emitSuccess(items: items);
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

  void emitSuccess({List<NewsItemData>? items, List<FilterItem>? tabs}) {
    emitState(
      type: NewsBlockStateType.LOADED,
      data: items,
      tabs: tabs,
    );
  }

  void emitError(String errorMsg) {
    emitState(type: NewsBlockStateType.ERROR, errorMessage: errorMsg);
  }

  void emitState({
    required NewsBlockStateType type,
    List<NewsItemData>? data,
    List<FilterItem>? tabs,
    String? errorMessage,
  }) {
    emit(NewsBlockState(
        type: type, data: data, tabs: tabs, errorMessage: errorMessage));
  }

  void refresh() {
    emit(NewsBlockState(type: NewsBlockStateType.LOADING));
  }
}
