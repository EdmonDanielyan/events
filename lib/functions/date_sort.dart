import 'package:ink_mobile/functions/date_functions.dart';

class DateTimeSort {
  List<DateTime> _dates = [];

  void addDate(DateTime dateTime) {
    _dates.add(dateTime);
  }

  bool hasDateByDay(DateTime dateTime) {
    if (_dates.length > 0) {
      for (var item in _dates) {
        if (DateFunctions(passedDate: dateTime).dayMonthYear() ==
            DateFunctions(passedDate: item).dayMonthYear()) return true;
      }
    }

    return false;
  }

  DateTime? getMessageDateTime(DateTime dateTime) {
    DateTime? returnDate = hasDateByDay(dateTime) ? null : dateTime;

    addDate(dateTime);
    return returnDate;
  }
}
