import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/get_section/sources%20/network.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/setup.dart';
import 'package:openapi/openapi.dart';

import 'get_section_state.dart';

@injectable
class GetSectionCubit extends Cubit<GetSectionCubitState> {
  GetSectionCubit()
      : super(GetSectionCubitState(type: GetSectionCubitStateEnums.LOADING));

  final String _socialPackageSectionName = "social";
  final String _emptySectionError = "There is no similar section";

  Future<void> fetch() async {
    try {
      await Token.setNewTokensIfExpired();
      final response = await getIt<SingleSectionNetworkRequest>(
          param1: _socialPackageSectionName)();
      // final pages = response.data?.data.pages.toList();
      //migation
      final pages = response.data?.data?.pages?.toList();
      if (pages != null) {
        emitSuccess(pages);
      } else {
        emitError(_emptySectionError);
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

  void emitSuccess(List<Page> pages) {
    emitState(
      newState: GetSectionCubitStateEnums.SUCCESS,
      data: pages,
    );
  }

  void emitError(String errorMsg) {
    emitState(
      newState: GetSectionCubitStateEnums.ERROR,
      errorMessage: errorMsg,
    );
  }

  void emitState({
    required GetSectionCubitStateEnums newState,
    List<Page>? data,
    errorMessage = "",
  }) {
    emit(state.copyWith(
        state: newState, data: data, errorMessage: errorMessage));
  }
}
