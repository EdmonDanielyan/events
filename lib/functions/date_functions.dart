import 'package:ink_mobile/localization/strings/language.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class DateFunctions {
  final DateTime passedDate;

  DateFunctions({required this.passedDate}) {
    initializeDateFormatting();
  }

  bool isThisYear() =>
      passedDate.toLocal().year == DateTime.now().toLocal().year;

  bool isThisMonth() =>
      passedDate.toLocal().month == DateTime.now().toLocal().month;

  bool isThisDay() => passedDate.toLocal().day == DateTime.now().toLocal().day;

  bool isDaysAgo(int days) =>
      passedDate.toLocal().day == DateTime.now().toLocal().day - days;

  bool isYesterday() => isThisYear() && isThisMonth() && isDaysAgo(1);

  bool isToday() => isThisYear() && isThisMonth() && isThisDay();

  String dayMonthYear() {
    DateFormat formatter = isThisYear()
        ? new DateFormat.MMMd("ru_RU")
        : new DateFormat.yMMMMd("ru_RU");

    return formatter.format(passedDate);
  }

  String dayMonthYearHuman(LanguageStrings strings) {
    if (isToday()) return strings.today;
    if (isYesterday()) return strings.yesterday;

    return dayMonthYear();
  }

  String hourMinute() {
    DateFormat formatter = new DateFormat("HH:mm");
    return formatter.format(passedDate.toLocal());
  }

  String displayDate() {
    if (isToday())
      return hourMinute();
    else
      return dayMonthYear() + " " + hourMinute();
  }
}
