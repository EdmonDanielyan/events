import 'package:openapi/openapi.dart';

enum GetSectionCubitStateEnums { LOADING, SUCCESS, ERROR }

class GetSectionCubitState {
  final GetSectionCubitStateEnums type;
  final List<Page> data;
  final String errorMessage;

  GetSectionCubitState({
    this.type = GetSectionCubitStateEnums.LOADING,
    this.data = const [],
    this.errorMessage = "",
  });

  GetSectionCubitState copyWith({
    GetSectionCubitStateEnums? state,
    List<Page>? data,
    String? errorMessage,
  }) {
    return GetSectionCubitState(
      type: state ?? type,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
