import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/cubits/custom/online_cubit/online_state.dart';
import 'package:ink_mobile/messenger/model/user.dart';

@singleton
class OnlineCubit extends Cubit<OnlineState> {
  OnlineCubit() : super(const OnlineState(users: []));

  void addUsers(List<User> newUsers) {
    emit(state.copyWith(
        users: List.from(users)
          ..addAll(newUsers)
          ..toSet().toList()));
  }

  void removeById(int userId) {
    emit(state.copyWith(
        users: List.from(users)
          ..removeWhere((element) => element.id == userId)));
  }

  List<User> get users => state.users;
}
