import 'package:flutter/material.dart';
import 'package:ink_mobile/functions/date_sort.dart';
import 'package:ink_mobile/functions/scroll_to_bottom.dart';

class MessageMixins {
  void bottomGapScroll(ScrollController controller) {
    if (controller.hasClients) {
      num bottomGap = controller.position.maxScrollExtent - controller.offset;
      if (bottomGap < 70) ScrollBottom(controller).scrollSmooth();
    }
  }

  DateTime? getMessageDateTime(DateTime dateTime, DateTimeSort dateTimeSort) {
    DateTime? returnDate =
        dateTimeSort.hasDateByDay(dateTime) ? null : dateTime;

    dateTimeSort.addDate(dateTime);
    return returnDate;
  }
}
