import 'package:ink_mobile/models/feedback/management_answer.dart';

enum FeedbackAnswerListCubitStateEnums { LOADING, SUCCESS, ERROR }

class FeedbackAnswerListCubitState {
  final FeedbackAnswerListCubitStateEnums state;
  final List<ManagementAnswer> data;
  final String errorMessage;

  FeedbackAnswerListCubitState({
    this.state = FeedbackAnswerListCubitStateEnums.LOADING,
    this.data = const [],
    this.errorMessage = "",
  });

  FeedbackAnswerListCubitState copyWith({
    FeedbackAnswerListCubitStateEnums? state,
    List<ManagementAnswer>? data,
    String? errorMessage,
  }) {
    return FeedbackAnswerListCubitState(
      state: state ?? this.state,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
