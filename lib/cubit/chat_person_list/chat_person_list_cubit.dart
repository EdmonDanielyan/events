import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/errors/dio_error_handler.dart';
import 'package:ink_mobile/cubit/chat_person_list/chat_person_list_state.dart';
import 'package:ink_mobile/cubit/chat_person_list/sources/network.dart';
import 'package:ink_mobile/exceptions/custom_exceptions.dart';
import 'package:ink_mobile/localization/i18n/i18n.dart';
import 'package:ink_mobile/models/chat/chat_user_select.dart';
import 'package:ink_mobile/models/debouncer.dart';
import 'package:ink_mobile/models/error_model.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/setup.dart';
import 'package:dio/dio.dart';
import 'package:ink_mobile/extensions/get_contacts.dart';

@injectable
class ChatPersonListCubit extends Cubit<ChatPersonListCubitState> {
  ChatPersonListCubit() : super(ChatPersonListCubitState());

  final _debouncerInputChange = Debouncer(milliseconds: 500);

  String get searchValue => state.searchValue;

  void init() {
    setSearchValue("");
  }

  Future<void> loadUsers() async {
    emitLoading();
    try {
      await Token.setNewTokensIfExpired();
      final response =
          await sl.get<ContactsNetworkRequest>(param1: searchValue)();

      List<ChatUserSelect> users = response.mapResponse(hideMe: true);
      emitUsers(items: users);
    } on DioError catch (e) {
      ErrorModel error = DioErrorHandler(e: e).call();
      emitError(error.msg);
    } on Exception catch (_) {
      emitError(localizationInstance.errorOccurred);
      throw UnknownErrorException();
    }
  }

  void setSearchValue(String value) {
    emit(state.copyWith(searchValue: value));
    _debouncerInputChange.run(() {
      loadUsers();
    });
  }

  void switchItemStatus(bool val, int index) {
    List<ChatUserSelect> users = state.searchUsers;
    users[index] = users.elementAt(index).copyWith(selected: val);
    emitUsers(items: users);
  }

  void emitLoading() {
    emit(state.copyWith(type: ChatPersonListEnums.LOADING));
  }

  void emitUsers({required List<ChatUserSelect> items}) {
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
