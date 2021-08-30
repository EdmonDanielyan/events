import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/cubit/main_page/news_block_state.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/models/error_response.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:main_api_client/api.dart';
import 'package:dio/dio.dart';
import 'package:main_api_client/api/news_api.dart';

class NewsBlockCubit extends Cubit<NewsBlockState>{
  NewsBlockCubit() : super(NewsBlockState(type: NewsBlockStateType.LOADING));
  static List<NewsItemData>? newsList;

  Future<void> fetchNews() async {

    try {
      await Token.setNewTokensIfExpired();

      MainApiClient api = MainApiClient();
      NewsApi newsApi = api.getNewsApi();

      final _response = await newsApi.getNews(
          pageNumber: 1,
          countOnPage: 5,
          filter: 'news'
      );

      final Map? newsDataMap = _response.data?.data.asMap;

      if (newsDataMap!.isNotEmpty) {
        newsList = NewsItemData.getListFromResponse(newsDataMap['news']);

        emitState(
          type: NewsBlockStateType.LOADED,
          data: newsList
        );
      } else {
        emitState(
            type: NewsBlockStateType.ERROR,
            errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
        );
        throw UnknownErrorException();
      }

    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        ErrorResponse response = ErrorResponse.fromException(e);

        if (response.code == 'QMA-6') {
          emitState(
              type: NewsBlockStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );
          throw InvalidRefreshTokenException();
        } else {
          emitState(
              type: NewsBlockStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );
          throw UnknownErrorException();
        }
      } else {

        emitState(
            type: NewsBlockStateType.ERROR,
            errorMessage: ErrorMessages.NO_CONNECTION_ERROR_MESSAGE
        );
        throw NoConnectionException();
      }

    } on Exception catch (e) {
      emitState(
        type: NewsBlockStateType.ERROR,
        errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
      );
      throw UnknownErrorException();
    }
  }

  void emitState({
    required NewsBlockStateType type,
    List<NewsItemData>? data,
    String? errorMessage
  }) {
    emit(NewsBlockState(
      type: type,
      data: data,
      errorMessage: errorMessage
    ));
  }

  void refresh() {
    emit(NewsBlockState(type: NewsBlockStateType.LOADING));
  }
}