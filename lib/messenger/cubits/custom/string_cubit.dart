import 'package:flutter_bloc/flutter_bloc.dart';

class StringCubit extends Cubit<String> {
  StringCubit(String initialState) : super(initialState);

  void setNew(String set) {
    emit(set);
  }
}
