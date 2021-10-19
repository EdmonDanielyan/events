import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/tags_list/domain/repository.dart';
import 'package:ink_mobile/cubit/tags_list/tags_list_state.dart';
import 'package:ink_mobile/cubit/tags_list/use_cases/fetch.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/selectfield.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/models/token.dart';

class TagsListCubit extends Cubit<TagsListCubitState> {
  TagsListCubit()
      : super(TagsListCubitState(state: TagsListCubitStateEnums.LOADING));

  Future<void> load() async {
    try {
      await Token.setNewTokensIfExpired();
      List<Selectfield> items = await TagsListFetch(
        dependency: TagsListRepository().getDependency(),
      ).call();
      emitSuccess(items);
    } on DioError catch (e) {
      ErrorModel error = DioErrorHandler(e: e).call();

      emitError(error.msg);
    } catch (e) {
      emitError(localizationInstance.errorOccurred);
    }
  }

  void emitSuccess(List<Selectfield> data) {
    emitState(
      newState: TagsListCubitStateEnums.SUCCESS,
      data: data,
    );
  }

  void emitError(String errorMsg) {
    emitState(
      newState: TagsListCubitStateEnums.ERROR,
      errorMessage: errorMsg,
    );
  }

  void emitState({
    required TagsListCubitStateEnums newState,
    List<Selectfield>? data,
    errorMessage = "",
  }) {
    emit(state.copyWith(
        state: newState, data: data, errorMessage: errorMessage));
  }
}
