import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/core/cubit/scroll_bottom_load_more/scroll_bottom_load_more_state.dart';

class ScrollBottomLoadMoreCubit extends Cubit<ScrollBottomLoadMoreState> {
  ScrollController scrollController = ScrollController();
  ScrollBottomLoadMoreCubit(ScrollBottomLoadMoreState initialState)
      : super(initialState) {
    scrollController.addListener(_scrollListener);
  }

  void switchIsOn(bool status) {
    emit(state.copyWith(isOn: status));
  }

  void setLoadFunction(Function load) {
    emit(state.copyWith(load: load));
  }

  void _scrollListener() {
    _scrolledToBottom();
  }

  void _scrolledToBottom() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      if (state.isOn && state.load != null) {
        state.load!();
      }
    }
  }
}
