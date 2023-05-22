class DateOnlyCompare {
  bool isSameDateWithoutYear(DateTime firstDate, DateTime secondDate) {
    return firstDate.month == secondDate.month &&
        firstDate.day == secondDate.day;
  }

  bool compareDateWithoutYear(DateTime firstDate, DateTime secondDate) {
    return (firstDate.month < secondDate.month) ||
        (firstDate.month == secondDate.month && firstDate.day < secondDate.day);
  }
}
