enum BootStateStateType {LOADING, LOADED, ERROR}

class BootState {
  BootState({
    required this.type,
    this.errorMessage
  }) : assert(
    type != BootStateStateType.ERROR
    || errorMessage != null
  );

  BootStateStateType type;
  String? errorMessage;
}