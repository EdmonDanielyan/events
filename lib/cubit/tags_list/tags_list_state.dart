import 'package:ink_mobile/models/selectfield.dart';

enum TagsListCubitStateEnums { LOADING, SUCCESS, ERROR }

class TagsListCubitState {
  final TagsListCubitStateEnums state;
  final List<Selectfield> data;
  final String errorMessage;

  TagsListCubitState({
    this.state = TagsListCubitStateEnums.LOADING,
    this.data = const [],
    this.errorMessage = "",
  });

  TagsListCubitState copyWith({
    TagsListCubitStateEnums? state,
    List<Selectfield>? data,
    String? errorMessage,
  }) {
    return TagsListCubitState(
      state: state ?? this.state,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
