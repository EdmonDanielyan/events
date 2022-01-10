import 'package:flutter/material.dart';
import 'package:ink_mobile/functions/scroll_to_bottom.dart';

class MessageMixins {
  bool isInBottom(ScrollController controller, {num gap = 70}) {
    if (controller.hasClients) {
      try {
        num bottomGap = controller.position.maxScrollExtent - controller.offset;
        if (bottomGap < gap) return true;
      } catch (_) {}
    }

    return false;
  }

  void bottomGapScroll(ScrollController controller) {
    if (controller.hasClients) {
      if (isInBottom(controller, gap: 20))
        ScrollBottom(controller).scrollSmooth();
    }
  }
}
