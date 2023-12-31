import 'package:flutter/material.dart';

class ScrollBottom {
  final ScrollController _controller;
  ScrollBottom(this._controller);

  void scrollSmooth({Duration duration = const Duration(microseconds: 500)}) {
    Future.delayed(const Duration(milliseconds: 500), () {
      animateTo(duration: duration);
    });
  }

  void jump() {
    if (_controller.hasClients) {
      _controller.jumpTo(_controller.position.maxScrollExtent);
    }
  }

  void jumpLazy() {
    if (_controller.hasClients) {
      Future.delayed(const Duration(milliseconds: 150), () {
        if (_controller.hasClients) {
          _controller.jumpTo(_controller.position.maxScrollExtent);
        }
      });
    }
  }

  void animateTo({Duration duration = const Duration(microseconds: 500)}) {
    if (_controller.hasClients) {
      if (_controller.hasClients) {
        _controller.animateTo(_controller.position.maxScrollExtent,
            duration: duration, curve: Curves.fastOutSlowIn);
      }
    }
  }
}
