import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/get_page/get_page_state.dart';
import 'package:ink_mobile/cubit/get_page/sources/network.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/setup.dart';
import 'package:openapi/openapi.dart';



@injectable
class GetPageCubit extends Cubit<GetPageCubitState> {
  GetPageCubit()
      : super(GetPageCubitState(
      type: GetPageCubitStateEnums.LOADING));

  String _emptySectionError = "There is no similar page";

  Future<void> fetch(String id) async {
    try {
      await Token.setNewTokensIfExpired();
      final response = await getIt<SinglePageNetworkRequest>(param1: id)();
      // final page = response.data?.data.page;
      //migration
      final page = response.data?.data?.page;
      if (page != null) {
        emitSuccess(page);
      } else {
        emitError(_emptySectionError);
      }
    } on DioError catch (e) {
      ErrorModel error = DioErrorHandler(e: e).call();
      emitError(error.msg);
      throw error.exception;
    } on Exception catch (_) {
      emitError(localizationInstance.errorOccurred);
      throw UnknownErrorException();
    }
  }

  void emitSuccess(Page page) {
    emitState(
      newState: GetPageCubitStateEnums.SUCCESS,
      data: page,
    );
  }

  void emitError(String errorMsg) {
    emitState(
      newState: GetPageCubitStateEnums.ERROR,
      errorMessage: errorMsg,
    );
  }

  void emitState({
    required GetPageCubitStateEnums newState,
    Page? data,
    errorMessage = "",
  }) {
    emit(state.copyWith(
        state: newState, data: data, errorMessage: errorMessage));
  }
}
