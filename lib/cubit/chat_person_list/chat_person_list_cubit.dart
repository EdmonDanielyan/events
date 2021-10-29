import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/chat_person_list/chat_person_list_state.dart';
import 'package:ink_mobile/cubit/search/sources/network.dart';
import 'package:ink_mobile/models/chat/chat_user_select.dart';
import 'package:ink_mobile/models/search/search_model.dart';
import 'package:ink_mobile/models/token.dart';
import 'package:ink_mobile/setup.dart';
import 'package:ink_mobile/extensions/get_search_success.dart';

@injectable
class ChatPersonListCubit extends Cubit<ChatPersonListCubitState> {
  ChatPersonListCubit() : super(ChatPersonListCubitState());

  void init() {
    state.searchValue = "";
    loadUsers();
  }

  Future<void> loadUsers() async {
    emitLoading();
    await Token.setNewTokensIfExpired();
    final response = await sl.get<SearchNetworkRequest>(param1: "ник")();
    SearchModel? searchModel = response.mapResponse();

    if (searchModel != null && searchModel.usersList.isNotEmpty) {
      emitUsers(
          items: ChatUserSelectViewModel.bySearchModel(searchModel.usersList));
    }
  }

  void setSearchValue(String value) {
    emit(state.copyWith(searchValue: value));
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
