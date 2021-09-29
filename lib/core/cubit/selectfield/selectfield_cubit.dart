import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/core/cubit/selectfield/selectfield_state.dart';
import 'package:ink_mobile/models/selectfield.dart';

class SelectfieldCubit extends Cubit<SelectfieldCubitState> {
  SelectfieldCubit({List<Selectfield> initialState = const []})
      : super(SelectfieldCubitState());

  void setItems(List<Selectfield> items) {
    emit(state.copyWith(items: items));
  }

  void setMode(AutovalidateMode mode) {
    emit(state.copyWith(validateMode: mode));
  }

  void clear() {
    emit(state.copyWith(
      items: [],
      validateMode: AutovalidateMode.onUserInteraction,
    ));
  }
}
