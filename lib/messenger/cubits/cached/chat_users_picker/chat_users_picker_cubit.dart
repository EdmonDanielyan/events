import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../model/chat.dart';
import '../../../model/user.dart';
import 'chat_users_picker_state.dart';

const CHATS_UNIQUE_KEY = "unique_key_3";

@singleton
class ChatUsersPickerCubit extends HydratedCubit<ChatUsersPickerState> {
  ChatUsersPickerCubit() : super(const ChatUsersPickerState(users: []));

  List<User> get users => state.users;

  void setUsers(List<User> newUsers) {
    emit(state.copyWith(users: newUsers));
  }

  void add(User user) {
    final newUsers = List<User>.from(users)..add(user);
    emit(state.copyWith(users: newUsers));
  }

  void remove(User user) {
    final newUsers = List<User>.from(users)..remove(user);
    emit(state.copyWith(users: newUsers));
  }

  void addUsers(List<User> items) {
    final newUsers = List<User>.from(users)..addAll(items);
    emit(state.copyWith(users: newUsers));
  }

  void onSearch(String val, Chat? chat) {
    if (_searchFunctions.isNotEmpty) {
      for (final func in _searchFunctions) {
        func(val, chat);
      }
    }
  }

  final Set<void Function(String, Chat?)> _searchFunctions = {};

  void addListenerToTyping(void Function(String, Chat?) func) {
    _searchFunctions.add(func);
  }

  List<User> getExceptParticipants(Chat chat) {
    List<User> newUsers = [];
    for (final user in users) {
      if (chat.participants.indexWhere((element) => element.id == user.id) <
          0) {
        newUsers.add(user);
      }
    }
    return newUsers;
  }

  @override
  ChatUsersPickerState? fromJson(Map<String, dynamic> json) =>
      ChatUsersPickerState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(ChatUsersPickerState state) => state.toMap();

  @override
  String get id => CHATS_UNIQUE_KEY;
}
