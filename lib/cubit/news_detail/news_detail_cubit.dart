import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/news_detail/use_cases/fetch.dart';
import 'package:ink_mobile/cubit/news_detail/use_cases/like.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/strings/language.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:ink_mobile/models/token.dart';
import 'domain/fetch_repository.dart';
import 'domain/like_repository.dart';
import 'news_detail_state.dart';
import 'package:dio/dio.dart';

class NewsDetailCubit extends Cubit<NewsDetailState> {
  LanguageStrings languageStrings;
  NewsDetailCubit({required this.languageStrings})
      : super(NewsDetailState(type: NewsDetailStateType.LOADING));

  Future<void> load(int newsId) async {
    try {
      await Token.setNewTokensIfExpired();

      NewsItemData item = await NewsDetailFetch(
        dependency: NewsDetailFetchRepository(newsId: newsId).getDependency(),
      ).call();

      emitSuccess(item);
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

  Future<void> like(int newsId) async {
    try {
      emitSuccess(state.data!.copyWith(isLiked: !state.data!.isLiked!));
      await Token.setNewTokensIfExpired();
      await NewsDetailLike(
        dependency: NewsDetailLikeRepository(newsId: newsId).getDependency(),
      ).like();
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) throw NoConnectionException();

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
