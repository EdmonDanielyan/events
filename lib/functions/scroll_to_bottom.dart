import 'package:flutter/material.dart';

class ScrollBottom {
  ScrollController _controller;
  ScrollBottom(this._controller);

  void scrollSmooth() {
    if (_controller.hasClients) {
      Future.delayed(Duration(milliseconds: 500), () {
        _controller.animateTo(
          _controller.position.maxScrollExtent,
          duration: Duration(milliseconds: 500),
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
}
