import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/error_response.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/api/news_api.dart';
import 'package:main_api_client/model/get_news_by_id.dart';
import 'package:main_api_client/model/news_property_by_id.dart';
import 'news_detail_state.dart';
import 'package:dio/dio.dart';

class NewsDetailCubit extends Cubit<NewsDetailState>
{
  NewsDetailCubit(): super (NewsDetailState(type: NewsDetailStateType.LOADING));

  Future<void> load(int newsId) async {
    try {
      await Token.setNewTokensIfExpired();

      MainApiClient api = MainApiClient();
      NewsApi newsApi = api.getNewsApi();
      Response<GetNewsById> response = await newsApi.newsIdGet(newsId);

      NewsPropertyById? newsData = response.data?.data;

      if (newsData != null) {
        NewsItemData newsItem = NewsItemData.fromProperty(newsData);

        emitState(
            type: NewsDetailStateType.LOADED,
            data: newsItem
        );
      } else {
        emitState(
            type: NewsDetailStateType.ERROR,
            errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
        );
        throw UnknownErrorException();
      }

    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        ErrorResponse response = ErrorResponse.fromException(e);

        if (response.code == 'QMA-6') {
          emitState(
              type: NewsDetailStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );
          throw InvalidRefreshTokenException();
        } else {
          emitState(
              type: NewsDetailStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );
          throw UnknownErrorException();
        }
      } else {
        emitState(
          type: NewsDetailStateType.ERROR,
          errorMessage: ErrorMessages.NO_CONNECTION_ERROR_MESSAGE
        );

        throw NoConnectionException();
      }

    } on Exception catch (e) {
      emitState(
          type: NewsDetailStateType.ERROR,
          errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
      );

      throw UnknownErrorException();
    }
  }

  void refresh() {
    emitState(type: NewsDetailStateType.LOADING);
  }

  void emitState({
    required NewsDetailStateType type,
    NewsItemData? data,
    String? errorMessage
  }) {
    emit(NewsDetailState(
        type: type,
        data: data,
        errorMessage: errorMessage
    ));
  }

  Future<bool> like(int newsId) async {
    try {
      await Token.setNewTokensIfExpired();

      MainApiClient api = MainApiClient();
      NewsApi newsApi = api.getNewsApi();

      await newsApi.newsLikeIdGet(newsId);
      return true;
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        throw NoConnectionException();
      }

      throw UnknownErrorException();
    } on Exception catch (e) {
      throw UnknownErrorException();
    }
  }
}