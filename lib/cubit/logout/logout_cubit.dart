import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/setup.dart';
import 'logout_state.dart';

import 'sources/logout_network.dart';

@injectable
class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());

  Future<void> logout() async {
    try {
      final response = await getIt<LogoutNetworkRequest>().postLogout();
      emit(LogoutLoaded(response));
    } catch (e) {
      emit(LogoutError(e));
    }
  }
}
