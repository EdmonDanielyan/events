import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/extensions/get_contacts.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/messenger/blocs/chat_person_list/chat_person_list_state.dart';
import 'package:ink_mobile/messenger/blocs/chat_person_list/sources/network.dart';
import 'package:ink_mobile/messenger/models/chat/database/chat_db.dart';
import 'package:ink_mobile/models/debouncer.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/setup.dart';

@singleton
class ChatPersonListCubit extends Cubit<ChatPersonListCubitState> {
  ChatPersonListCubit() : super(ChatPersonListCubitState());

  List<UserTable> get items => state.searchUsers;

  final _debouncerInputChange = Debouncer(milliseconds: 500);

  String get searchValue => state.searchValue;

  List<int> hideIds = [];

  int pageNumber = 1;

  void init() {
    setSearchValue("", checkCondition: false);
  }

  Future<void> loadUsers() async {
    emitLoading();
    try {
      await Token.setNewTokensIfExpired();
      final response = await sl<ContactsNetworkRequest>(param1: searchValue)(
          pageNumber: pageNumber);

      List<UserTable> users =
          response.mapResponse(hideIds: hideIds, searchValue: searchValue);

      if (searchValue.isEmpty && users.isEmpty) {
        pageNumber++;
        loadUsers();
      }
      emitUsers(items: users);
    } on DioError catch (e) {
      ErrorModel error = DioErrorHandler(e: e).call();

      emitError(error.msg);
    } on Exception catch (_) {
      emitError(localizationInstance.errorOccurred);
      throw UnknownErrorException();
    }
  }

  void setSearchValue(String value, {bool checkCondition = true}) {
    value = value.trim();
    emit(state.copyWith(searchValue: value));

    if (!checkCondition ||
        (value.length >= 3 || state.type == ChatPersonListEnums.ERROR)) {
      _debouncerInputChange.run(() {
        loadUsers();
      });
    }
  }

  void emitLoading() {
    emit(state.copyWith(type: ChatPersonListEnums.LOADING));
  }

  void emitUsers({required List<UserTable> items}) {
    emit(
      state.copyWith(
        searchUsers: items,
        type: ChatPersonListEnums.LOADED,
      ),
    );
  }

  void emitError(String errorMsg) {
    emit(state.copyWith(type: ChatPersonListEnums.ERROR, errorMsg: errorMsg));
  }
}
