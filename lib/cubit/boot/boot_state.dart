enum InitialStateType {LOADING, LOAD_MAIN, LOAD_WELCOME, ERROR}

class BootState {
  BootState({
    required this.type,
    this.errorMessage
  }) : assert(
    type != InitialStateType.ERROR
    || errorMessage != null
  );

  InitialStateType type;
  String? errorMessage;
}