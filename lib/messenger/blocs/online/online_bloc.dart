import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/logging/loggable.dart';

class OnlineBlocState {
  final Map<int, DateTime> onlineUsers;
  OnlineBlocState(this.onlineUsers);
  bool isOnline(int? userId) => onlineUsers.containsKey(userId);
}

@lazySingleton
class OnlineBloc extends Cubit<OnlineBlocState> with Loggable implements Disposable {
  late Timer _onlineExpireTimer;
  static const EXPIRED_ONLINE_STATUS_SECONDS = 50;

  OnlineBloc(): super(OnlineBlocState({})) {
    _onlineExpireTimer = Timer.periodic(Duration(seconds: EXPIRED_ONLINE_STATUS_SECONDS), (timer) {
      updateOnlineUsers();
    });
  }

  void updateOnlineUsers([List<int>? newUsers]) {
    logger.finest("updateOnlineUsers");
    var users = state.onlineUsers;
    users.removeWhere((key, value) {
      var seconds = DateTime.now().difference(value).inSeconds;
      return seconds > 50;
    });
    newUsers?.forEach((userId) {
      users[userId] = DateTime.now();
    });
    emit(OnlineBlocState(users));
  }

  @override
  FutureOr onDispose() {
    _onlineExpireTimer.cancel();
  }
}

