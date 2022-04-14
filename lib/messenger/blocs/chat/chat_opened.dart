import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/cubit/bool_cubit/bool_state.dart';

@singleton
class ChatOpenedCubit extends Cubit<BoolState> {
  ChatOpenedCubit() : super(const BoolState(enable: false));

  void set(bool setter) {
    emit(BoolState(enable: setter));
  }
}
