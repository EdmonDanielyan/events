import 'package:ink_mobile/models/birthday_data.dart';

class BirthDayResponse {
  final List<BirthdayData> birthdaysToday;
  final List<BirthdayData> birthdaysOther;
  BirthDayResponse({
    this.birthdaysToday = const [],
    this.birthdaysOther = const [],
  });

  BirthDayResponse copyWith({
    List<BirthdayData>? birthdaysToday,
    List<BirthdayData>? birthdaysOther,
  }) {
    return BirthDayResponse(
      birthdaysToday: birthdaysToday ?? this.birthdaysToday,
      birthdaysOther: birthdaysOther ?? this.birthdaysOther,
    );
  }
}
