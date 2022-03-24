import 'package:flutter_bloc/flutter_bloc.dart';

import 'bool_state.dart';

class BoolCubit extends Cubit<BoolState> {
  BoolCubit(bool initialState) : super(BoolState(enable: initialState));

  void setNew(bool enable) {
    emit(state.copyWith(enable: enable));
  }

  bool get enabled => state.enable;
}
