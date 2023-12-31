import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/core/scrolling_loader/scroll_bottom_to_load.dart';
import 'package:ink_mobile/cubit/learning_materials_list/sources/network.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/functions/errors.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/learning_materials_data.dart';
import 'package:ink_mobile/models/pagination.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/setup.dart';
import 'learning_materials_list_state.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/extensions/get_publications.dart';

@injectable
class LearningMaterialsListCubit extends Cubit<LearningMaterialsListState> {
  Pagination<LearningMaterialsData> pagination =
      Pagination<LearningMaterialsData>(countOnPage: 10);
  ScrollBottomToLoad scrollBottomToLoad = ScrollBottomToLoad();

  LearningMaterialsListCubit()
      : super(const LearningMaterialsListState(
            type: LearningMaterialsListStateType.LOADING));

  Future<void> fetch() async {
    try {
      if (pagination.next) {
        await Token.setNewTokensIfExpired();
        final response = await getIt<LearningMaterialListNetworkRequest>(
            param1: pagination)();
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

  void refresh() {
    resetProperties();
    emitState(type: LearningMaterialsListStateType.LOADING);
  }

  void emitSuccess(List<LearningMaterialsData> items) {
    emitState(
      type: LearningMaterialsListStateType.LOADED,
      data: items,
    );
  }

  void emitError(String errorMsg) {
    emitState(
      type: LearningMaterialsListStateType.ERROR,
      errorMessage: errorMsg,
    );
  }

  void emitState(
      {required LearningMaterialsListStateType type,
      List<LearningMaterialsData>? data,
      String? errorMessage}) {
    emit(LearningMaterialsListState(
        type: type, data: data, errorMessage: errorMessage));
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
}
