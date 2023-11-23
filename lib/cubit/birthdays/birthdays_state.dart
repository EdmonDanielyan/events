import 'package:equatable/equatable.dart';
import 'package:ink_mobile/models/birthday_data.dart';

enum BirthdaysStateType { LOADING, LOADED, ERROR, EMPTY }

class BirthdaysState extends Equatable {
  final List<BirthdayData>? birthdaysToday;
  final List<BirthdayData>? birthdaysOther;
  final List<BirthdayData>? firstDayBirthdays;
  final List<BirthdayData>? secondDayBirthdays;
  final List<BirthdayData>? thirdDayBirthdays;
  final BirthdaysStateType type;
  final String? errorMessage;

  const BirthdaysState({
    this.birthdaysToday,
    this.birthdaysOther,
    this.firstDayBirthdays,
    this.secondDayBirthdays,
    this.thirdDayBirthdays,
    required this.type,
    this.errorMessage,
  }) : assert(
            type != BirthdaysStateType.ERROR ||
                (type == BirthdaysStateType.ERROR && errorMessage != null),
            'errorMessage must not be null in error state');

  BirthdaysState copyWith({
    List<BirthdayData>? birthdaysToday,
    List<BirthdayData>? birthdaysOther,
    List<BirthdayData>? firstDayBirthdays,
    List<BirthdayData>? secondDayBirthdays,
    List<BirthdayData>? thirdDayBirthdays,
    BirthdaysStateType? type,
    String? errorMessage,
  }) {
    return BirthdaysState(
      birthdaysToday: birthdaysToday ?? this.birthdaysToday,
      birthdaysOther: birthdaysOther ?? this.birthdaysOther,
      firstDayBirthdays: firstDayBirthdays ?? this.firstDayBirthdays,
      secondDayBirthdays: secondDayBirthdays ?? this.secondDayBirthdays,
      thirdDayBirthdays: thirdDayBirthdays ?? this.thirdDayBirthdays,
      type: type ?? this.type,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props =>
      [birthdaysToday, birthdaysOther, type, errorMessage];
}
