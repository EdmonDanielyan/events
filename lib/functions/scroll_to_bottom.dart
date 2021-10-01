import 'package:flutter/material.dart';

void scrollToBottom(ScrollController controller) {
  Future.delayed(Duration(milliseconds: 500), () {
    controller.animateTo(controller.position.maxScrollExtent,
        duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
  });
}
