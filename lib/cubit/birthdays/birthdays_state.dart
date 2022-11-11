// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:ink_mobile/models/birthday_data.dart';

enum BirthdaysStateType { LOADING, LOADED, ERROR, EMPTY }

class BirthdaysState extends Equatable {
  final List<BirthdayData>? birthdaysToday;
  final List<BirthdayData>? birthdaysOther;
  final BirthdaysStateType type;
  final String? errorMessage;

  const BirthdaysState({
    this.birthdaysToday,
    this.birthdaysOther,
    required this.type,
    this.errorMessage,
  }) : assert(
            type != BirthdaysStateType.ERROR ||
                (type == BirthdaysStateType.ERROR && errorMessage != null),
            'errorMessage must not be null in error state');

  BirthdaysState copyWith({
    List<BirthdayData>? birthdaysToday,
    List<BirthdayData>? birthdaysOther,
    BirthdaysStateType? type,
    String? errorMessage,
  }) {
    return BirthdaysState(
      birthdaysToday: birthdaysToday ?? this.birthdaysToday,
      birthdaysOther: birthdaysOther ?? this.birthdaysOther,
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
