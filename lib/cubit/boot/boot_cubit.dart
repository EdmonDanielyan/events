import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/cubit/boot/boot_state.dart';

@singleton
class BootCubit extends Cubit<BootState> {
  BootCubit()
      : super(BootState(type: InitialStateType.LOADING));

  late Future<bool> Function() _onStart;

  set onStart(Future<bool> Function() value) {
    _onStart = value;
  }

  void load() async {
    await _onStart();
  }

  void emitState({required InitialStateType type, String? errorMessage}) {
    emit(BootState(type: type, errorMessage: errorMessage));
  }
}
