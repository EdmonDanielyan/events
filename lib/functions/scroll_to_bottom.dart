import 'package:flutter/material.dart';

class ScrollBottom {
  ScrollController _controller;
  ScrollBottom(this._controller);

  void scrollSmooth({Duration duration = const Duration(microseconds: 500)}) {
    if (_controller.hasClients) {
      Future.delayed(Duration(milliseconds: 500), () {
        _controller.animateTo(
          _controller.position.maxScrollExtent,
          duration: duration,
          curve: Curves.fastOutSlowIn,
        );
      });
    }
  }

  void jump() {
    if (_controller.hasClients) {
      _controller.jumpTo(_controller.position.maxScrollExtent);
    }
  }

  void jumpLazy() {
    if (_controller.hasClients) {
      Future.delayed(Duration(milliseconds: 150), () {
        _controller.jumpTo(_controller.position.maxScrollExtent);
      });
    }
  }
}
