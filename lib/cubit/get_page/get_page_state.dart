import 'package:openapi/openapi.dart';

enum GetPageCubitStateEnums { LOADING, SUCCESS, ERROR }

class GetPageCubitState {
  final GetPageCubitStateEnums type;
  final Page? data;
  final String errorMessage;

  GetPageCubitState({
    this.type = GetPageCubitStateEnums.LOADING,
    this.data,
    this.errorMessage = "",
  });

  GetPageCubitState copyWith({
    GetPageCubitStateEnums? state,
    Page? data,
    String? errorMessage,
  }) {
    return GetPageCubitState(
      type: state ?? this.type,
      data: data,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
