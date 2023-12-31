import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_state.dart';
import 'package:ink_mobile/messenger/model/user.dart';

import '../chat_users_picker/chat_users_picker_cubit.dart';

@singleton
class CachedUsersCubit extends HydratedCubit<CachedUsersState> {
  CachedUsersCubit()
      : super(
          CachedUsersState(users: const [], lastCached: DateTime(2000, 9, 7)),
        );

  List<User> get users => state.users;
  DateTime get lastCached => state.lastCached;

  void clean() {
    emit(CachedUsersState(
      users: const [],
      lastCached: DateTime(2000, 9, 7),
    ));
  }

  User? getUser(int userId) {
    final index = users.indexWhere((element) => element.id == userId);

    return index >= 0 ? users[index] : null;
  }

  bool exists(int userId) {
    return users.indexWhere((element) => element.id == userId) >= 0;
  }

  void removeAndAddUser(User user, int userId) {
    final _newUsers = List<User>.from(users)
      ..removeWhere((element) => element.id == userId)
      ..add(user)
      ..toSet().toList();

    emit(state.copyWith(users: _newUsers));
  }

  void addUsers(List<User> newUsers) {
    final _newUsers = List<User>.from(users)
      ..addAll(newUsers)
      ..toSet().toList();
    emit(state.copyWith(users: _newUsers));
  }

  bool passedTimeAfterLastCache(Duration duration) {
    return lastCached.isAfter(DateTime.now().subtract(duration));
  }

  void updateUserById(User user, int userId) {
    if (users.isNotEmpty) {
      List<User> newUsers = [];

      for (final storedUser in users) {
        if (storedUser.id == userId) {
          newUsers.add(user);
        } else {
          newUsers.add(storedUser);
        }
      }

      emit(state.copyWith(users: newUsers));
    }
  }

  @override
  CachedUsersState? fromJson(Map<String, dynamic> json) =>
      CachedUsersState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(CachedUsersState state) => state.toMap();

  @override
  String get id => CHATS_UNIQUE_KEY;
}
