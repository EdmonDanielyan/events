import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/assets/constants.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/errors.dart';
import 'package:ink_mobile/models/error_response.dart';
import 'package:ink_mobile/models/learning_materials_data.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:main_api_client/api.dart';
import 'package:main_api_client/api/publications_api.dart';
import 'package:main_api_client/model/get_publications.dart';
import 'learning_materials_list_state.dart';
import 'package:dio/dio.dart';

class LearningMaterialsListCubit extends Cubit<LearningMaterialsListState>
{
  static PublicationsApi learningMaterialsApi = MainApiClient()
      .getPublicationsApi();

  static const int BOTTOM_SCROLL_OFFSET = 300;
  static const int COUNT = 10;

  int pageNumber = 1;
  bool isLastPage = false;
  bool isLoading = false;
  double loadedHeight = 0.0;
  List<LearningMaterialsData> learningMaterialsList = [];

  LearningMaterialsListCubit(): super(LearningMaterialsListState(
      type: LearningMaterialsListStateType.LOADING
  ));

  Future<void> fetch() async {
    try {
      if (!isLastPage) {
        await Token.setNewTokensIfExpired();

        Response<GetPublications> response = await learningMaterialsApi
            .publicationsGet(
            countOnPage: COUNT,
            pageNumber: pageNumber
        );
        Map? publicationListData = response.data?.data.asMap;

        if (publicationListData != null) {
          learningMaterialsList.addAll(
              LearningMaterialsData.getListFromMap(
                  publicationListData['publications']
              )
          );

          if (publicationListData['next'] == null) {
            isLastPage = true;
          } else {
            pageNumber++;
          }

          emitState(
              type: LearningMaterialsListStateType.LOADED,
              data: learningMaterialsList
          );
        } else {
          emitState(
              type: LearningMaterialsListStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );
          throw UnknownErrorException();
        }
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        ErrorResponse response = ErrorResponse
            .fromException(e);

        if (response.code == 'QMA-6') {
          emitState(
              type: LearningMaterialsListStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );
          throw InvalidRefreshTokenException();
        } else {
          emitState(
              type: LearningMaterialsListStateType.ERROR,
              errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
          );
          throw UnknownErrorException();
        }
      } else {
        emitState(
            type: LearningMaterialsListStateType.ERROR,
            errorMessage: ErrorMessages.NO_CONNECTION_ERROR_MESSAGE
        );
        throw NoConnectionException();
      }

    } on Exception catch (e) {
      emitState(
          type: LearningMaterialsListStateType.ERROR,
          errorMessage: ErrorMessages.SIMPLE_ERROR_MESSAGE
      );
      throw UnknownErrorException();
    }
  }

  void resetProperties() {
    pageNumber = 1;
    learningMaterialsList = [];
    isLastPage = false;
    isLoading = false;
    loadedHeight = 0.0;
  }

  void refresh() {
    resetProperties();
    emitState(type: LearningMaterialsListStateType.LOADING);
  }

  void emitState({
    required LearningMaterialsListStateType type,
    List<LearningMaterialsData>? data,
    String? errorMessage
  }) {
    emit(LearningMaterialsListState(
        type: type,
        data: data,
        errorMessage: errorMessage
    ));
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
}