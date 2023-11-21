import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/news_detail/sources/fetch/network.dart';
import 'package:ink_mobile/cubit/news_detail/sources/like/network.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/setup.dart';
import 'news_detail_state.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/extensions/get_news_by_id.dart';

@injectable
class NewsDetailCubit extends Cubit<NewsDetailState> {
  NewsDetailCubit() : super(NewsDetailState(type: NewsDetailStateType.LOADING));

  bool get isLiked => state.data!.isLiked!;
  int get countLikes => state.data!.likeCount!;

  Future<void> load(int newsId) async {
    try {
      await Token.setNewTokensIfExpired();
      final response = await getIt<NewsDetailNetworkRequest>(param1: newsId)();
      emitSuccess(response.mapResponse());
    } on DioError catch (e) {
      ErrorModel error = DioErrorHandler(e: e).call();

      emitError(error.msg);
      throw error.exception;
    } on Exception catch (_) {
      emitError(localizationInstance.errorOccurred);
      throw UnknownErrorException();
    }
  }

  Future<void> like(int newsId) async {
    try {
      int likeCount = state.data!.isLiked!
          ? state.data!.likeCount! - 1
          : state.data!.likeCount! + 1;
      emitSuccess(state.data!
          .copyWith(isLiked: !state.data!.isLiked!, likeCount: likeCount));
      await Token.setNewTokensIfExpired();
      await getIt<NewsLikeNetworkRequest>(param1: newsId)();
    } on DioError catch (e) {
       //TODO   DioErrorType.other
      if (e.type == DioErrorType.unknown) throw NoConnectionException();

      throw UnknownErrorException();
    } on Exception catch (_) {
      throw UnknownErrorException();
    }
  }

  void emitSuccess(NewsItemData item) {
    emitState(type: NewsDetailStateType.LOADED, data: item);
  }

  void emitError(String errorMsg) {
    emitState(type: NewsDetailStateType.ERROR, errorMessage: errorMsg);
  }

  void refresh() {
    emitState(type: NewsDetailStateType.LOADING);
  }

  void emitState(
      {required NewsDetailStateType type,
      NewsItemData? data,
      String? errorMessage}) {
    emit(NewsDetailState(type: type, data: data, errorMessage: errorMessage));
  }
}
