import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/chat_person_list/chat_person_list_state.dart';
import 'package:ink_mobile/cubit/chat_person_list/sources/network.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/debouncer.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/setup.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/extensions/get_contacts.dart';

import '../../messenger/model/user.dart';

@singleton
class ChatPersonListCubit extends Cubit<ChatPersonListCubitState> {
  ChatPersonListCubit() : super(ChatPersonListCubitState());

  List<User> get items => state.searchUsers;

  final _debouncerInputChange = Debouncer(milliseconds: 500);

  String get searchValue => state.searchValue;

  List<int> hideIds = [];

  Set<void Function(List<User>)> _functions = {};

  void addListener(void Function(List<User>) func) {
    _functions.add(func);
  }

  void init() {
    setSearchValue("", checkCondition: false);
  }

  Future<void> loadUsers() async {
    emitLoading();
    try {
      await Token.setNewTokensIfExpired();
      final response =
          await getIt<ContactsNetworkRequest>(param1: searchValue)();

      List<User> users = response.mapResponse(hideIds: hideIds);

      if (_functions.isNotEmpty) {
        for (final fn in _functions) {
          fn(users);
        }
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
    if (!checkCondition || value.length >= 3) {
      _debouncerInputChange.run(() {
        loadUsers();
      });
    }
  }

  void emitLoading() {
    emit(state.copyWith(type: ChatPersonListEnums.LOADING));
  }

  void emitUsers({required List<User> items}) {
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
