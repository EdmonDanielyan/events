import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/cubits/cached/users/cached_users_state.dart';
import 'package:ink_mobile/messenger/model/user.dart';

@singleton
class CachedUsersCubit extends HydratedCubit<CachedUsersState> {
  CachedUsersCubit() : super(const CachedUsersState(users: []));

  List<User> get users => state.users;

  User? getUser(int userId) {
    final index = users.indexWhere((element) => element.id == userId);

    return index >= 0 ? users[index] : null;
  }

  bool exists(int userId) {
    return users.indexWhere((element) => element.id == userId) >= 0;
  }

  void addUsers(List<User> newUsers) {
    final _newUsers = List<User>.from(users)
      ..addAll(newUsers)
      ..toSet().toList();
    emit(state.copyWith(users: _newUsers));
  }

  @override
  CachedUsersState? fromJson(Map<String, dynamic> json) =>
      CachedUsersState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(CachedUsersState state) => state.toMap();
}
