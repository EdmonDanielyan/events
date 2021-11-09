import 'package:flutter/material.dart';
import 'package:ink_mobile/functions/scroll_to_bottom.dart';

class MessageMixins {
  bool isInBottom(ScrollController controller, {num gap = 70}) {
    if (controller.hasClients) {
      num bottomGap = controller.position.maxScrollExtent - controller.offset;
      if (bottomGap < gap) return true;
    }

    return false;
  }

  void bottomGapScroll(ScrollController controller) {
    if (controller.hasClients) {
      if (isInBottom(controller)) ScrollBottom(controller).scrollSmooth();
    }
  }
}
