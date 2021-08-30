import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/errors.dart';
import 'package:ink_mobile/models/error_response.dart';
import 'package:ink_mobile/models/news_data.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/api/news_api.dart';
import 'package:main_api_client/model/get_news.dart';
import 'news_list_state.dart';
import 'package:dio/dio.dart';

class NewsListCubit extends Cubit<NewsListState>
{
  static NewsApi newsApi = MainApiClient().getNewsApi();
  static const int COUNT = 5;
  static const BOTTOM_SCROLL_OFFSET = 300;

  String filter = 'news';

  int pageNumber = 1;
  bool isLastPage = false;
  bool isLoading = false;
  double loadedHeight = 0.0;
  List<NewsItemData> newsList = [];

  NewsListCubit(): super(NewsListState(type: NewsListStateType.LOADING));

  Future<void> fetch() async {
    try {
      if (!isLastPage) {

        await Token.setNewTokensIfExpired();

        Response<GetNews> response = await newsApi.getNews(
          countOnPage: COUNT,
          pageNumber: pageNumber,
          filter: filter
        );

        Map? newsListData = response.data?.data.asMap;

        if (newsListData != null) {
          newsList.addAll(
              NewsItemData.getListFromResponse(newsListData['news'])
          );

          if (newsListData['next'] == null) {
            isLastPage = true;
          } else {
            pageNumber++;
          }

          emitState(
              type: NewsListStateType.LOADED,
              data: newsList
          );
        } else {
          emitState(
              type: NewsListStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );
          throw UnknownErrorException();
        }
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        ErrorResponse response = ErrorResponse.fromException(e);

        if (response.code == 'QMA-6') {
          emitState(
              type: NewsListStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );
          throw InvalidRefreshTokenException();
        } else {
          emitState(
              type: NewsListStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );
          throw UnknownErrorException();
        }
      } else {
        emitState(
            type: NewsListStateType.ERROR,
            errorMessage: ErrorMessages.NO_CONNECTION_ERROR_MESSAGE
        );
        throw NoConnectionException();
      }

    } on Exception catch (e) {
      emitState(
          type: NewsListStateType.ERROR,
          errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
      );
      throw UnknownErrorException();
    }
  }

  void resetProperties() {
    pageNumber = 1;
    newsList = [];
    isLastPage = false;
    isLoading = false;
    loadedHeight = 0.0;
  }

  void refresh() {
    resetProperties();
    emit(NewsListState(type: NewsListStateType.LOADING));
  }

  Future<void> onScroll(ScrollController controller) async {
    bool reachedLoadTrigger =
        controller.offset
            >= controller.position.maxScrollExtent
            - BOTTOM_SCROLL_OFFSET;

    bool wasNotLoadedAlready = controller.offset > loadedHeight;

    if (
    reachedLoadTrigger
        && wasNotLoadedAlready
        && !controller.position.outOfRange
        && !isLoading
    ) {
      isLoading = true;
      loadedHeight = controller.position.maxScrollExtent;

      await
        fetch()
          .then((value) {
            isLoading = false;
          })
          .onError((error, stackTrace) {
            String message;

            if (error is NoConnectionException) {
              message = ErrorMessages.NO_CONNECTION_ERROR_MESSAGE;
            } else {
              message = ErrorMessages.UNKNOWN_ERROR_MESSAGE;
            }

            showErrorDialog(message);

            isLoading = false;
          });
    }
  }

  emitState({
    required NewsListStateType type,
    List<NewsItemData>? data,
    String? errorMessage
  }) {
    emit(NewsListState(
      type: type,
      data: data,
      errorMessage: errorMessage
    ));
  }
}