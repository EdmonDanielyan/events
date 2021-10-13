import 'package:flutter/material.dart';

class ScrollBottomToLoad {
  final int bottomScrollOffset;
  bool isLoading;
  double loadedHeight;
  late ScrollController _controller;

  ScrollBottomToLoad(
      {this.bottomScrollOffset = 300,
      this.isLoading = false,
      this.loadedHeight = 0.0});

  void setController(ScrollController controller) {
    _controller = controller;
  }

  Future<void> onScroll(Function onCall) async {
    bool reachedLoadTrigger = _controller.offset >=
        _controller.position.maxScrollExtent - bottomScrollOffset;

    bool wasNotLoadedAlready = _controller.offset > loadedHeight;

    if (reachedLoadTrigger &&
        wasNotLoadedAlready &&
        !_controller.position.outOfRange &&
        !isLoading) {
      isLoading = true;
      loadedHeight = _controller.position.maxScrollExtent;

      onCall();
    }
  }

  void clear() {
    isLoading = false;
    loadedHeight = 0.0;
  }
}
