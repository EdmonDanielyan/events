class DateTimeSort {
  final List<DateTime> _dates = [];

  void addDate(DateTime dateTime) {
    _dates.add(dateTime);
  }

  bool hasDateByDay(DateTime dateTime) => _dates.any((item) =>
      dateTime.year == item.year &&
      dateTime.month == item.month &&
      dateTime.day == item.day);

  DateTime? getMessageDateTime(DateTime dateTime) {
    DateTime? returnDate = hasDateByDay(dateTime) ? null : dateTime;

    addDate(dateTime);
    return returnDate;
  }
}
