import 'package:flutter/material.dart';

class ScrollBottomLoadMoreState {
  final bool isOn;
  final Function? load;
  ScrollBottomLoadMoreState({
    this.isOn = true,
    this.load,
  });

  ScrollBottomLoadMoreState copyWith({
    bool? isOn,
    ScrollController? controller,
    Function? load,
  }) {
    return ScrollBottomLoadMoreState(
      isOn: isOn ?? this.isOn,
      load: load ?? this.load,
    );
  }
}
