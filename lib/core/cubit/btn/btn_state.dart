enum BtnCubitStateEnums { INITIAL, SENDING, SUCCESS, ERROR }

class BtnCubitState {
  final BtnCubitStateEnums state;
  final String message;

  BtnCubitState({
    this.state = BtnCubitStateEnums.INITIAL,
    this.message = "",
  });

  BtnCubitState copyWith({
    BtnCubitStateEnums? state,
    String? message,
  }) {
    return BtnCubitState(
      state: state ?? this.state,
      message: message ?? this.message,
    );
  }
}
