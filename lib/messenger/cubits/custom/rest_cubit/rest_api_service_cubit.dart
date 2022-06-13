import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/messenger/api/rest_client/error/error_response.dart';
import 'package:ink_mobile/messenger/providers/logger.dart';

import 'rest_api_service_state.dart';

class RestApiServiceCubit<T, K> extends Cubit<RestApiServiceState<T, K?>> {
  RestApiServiceCubit(RestApiServiceState<T, K?> initialState)
      : super(initialState);

  bool get isError => state.loadingState == LoadingState.error;

  void newLoaadFunction(Future<dynamic> Function() load) {
    emit(state.copyWith(load: load));
  }

  Future<T?> load({
    void Function(ErrorApiResponse?)? errorCallback,
  }) async {
    try {
      emitState(LoadingState.loading);
      final response = await state.load();
      emitState(LoadingState.loaded);

      return response;
    } catch (e, stack) {
      ErrorApiResponse? response;
      if (e is DioError) {
        final res = (e).response;

        logger.e(
          "Got error : ${res?.realUri} ${res?.statusCode} -> ${res?.data}",
          className: "RestApiServiceCubit",
          methodName: "load",
          stackTrace: stack,
        );

        if (res?.data != null && res?.data is Map<String, dynamic>) {
          response = ErrorApiResponse.fromJson(res?.data);
        }

        if (errorCallback != null) {
          errorCallback(response);
        }
      } else {
        logger.e(
          "UnexpectedError : $e ",
          stackTrace: stack,
          className: "RestApiServiceCubit",
          methodName: "load",
        );
      }

      emitError(response);
    }
    return null;
  }

  void emitState(LoadingState loadingState) {
    emit(state.copyWith(loadingState: loadingState));
  }

  void emitError(ErrorApiResponse? errorApiResponse) {
    emit(
      state.copyWith(
        errorApiResponse: errorApiResponse,
        loadingState: LoadingState.error,
      ),
    );
  }
}
