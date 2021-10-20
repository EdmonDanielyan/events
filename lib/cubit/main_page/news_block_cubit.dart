import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/main_page/news_block_state.dart';
import 'package:ink_mobile/cubit/news_list/sources/network.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/setup.dart';
import 'package:ink_mobile/extensions/get_news.dart';

@injectable
class NewsBlockCubit extends Cubit<NewsBlockState> {
  NewsBlockCubit() : super(NewsBlockState(type: NewsBlockStateType.LOADING));

  Pagination<NewsItemData> pagination =
      Pagination<NewsItemData>(countOnPage: 5);

  Future<void> fetchNews() async {
    try {
      await Token.setNewTokensIfExpired();

      final response = await sl.get<NewsListNetworkRequest>(
          param1: pagination, param2: "news")();
      final mapResponse = response.mapResponse(pagination);
      emitSuccess(mapResponse.items);
    } on DioError catch (e) {
      ErrorModel error = DioErrorHandler(e: e).call();

      emitError(error.msg);
      throw error.exception;
    } on Exception catch (_) {
      emitError(localizationInstance.errorOccurred);
      throw UnknownErrorException();
    }
  }

  void emitSuccess(List<NewsItemData> items) {
    emitState(type: NewsBlockStateType.LOADED, data: items);
  }

  void emitError(String errorMsg) {
    emitState(type: NewsBlockStateType.ERROR, errorMessage: errorMsg);
  }

  void emitState(
      {required NewsBlockStateType type,
      List<NewsItemData>? data,
      String? errorMessage}) {
    emit(NewsBlockState(type: type, data: data, errorMessage: errorMessage));
  }

  void refresh() {
    emit(NewsBlockState(type: NewsBlockStateType.LOADING));
  }
}
