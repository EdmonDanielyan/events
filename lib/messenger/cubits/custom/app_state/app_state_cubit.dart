import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/messenger/cubits/custom/app_state/app_state.dart';

@singleton
class AppStateCubit extends Cubit<AppState> {
  AppStateCubit() : super(const AppState());

  AppBackgroundState get currentState => state.state;

  void changeState(AppBackgroundState newState) {
    emit(state.copyWith(state: newState));
  }
}
