import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/user.dart';

class UsersCubit extends Cubit<List<User>> {
  UsersCubit() : super([]);

  List<User> get users => state;

  void add(User user) {
    final newUsers = List<User>.from(users)..add(user);
    emit(newUsers);
  }

  void remove(User user) {
    final newUsers = List<User>.from(users)..remove(user);
    emit(newUsers);
  }

  void addUsers(List<User> items) {
    final newUsers = List<User>.from(users)..addAll(items);
    emit(newUsers);
  }
}
