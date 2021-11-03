enum InitialStateType { LOADING, LOAD_MAIN, LOAD_WELCOME, ERROR }

class InitialState {
  InitialState({required this.type, this.errorMessage})
      : assert(type != InitialStateType.ERROR || errorMessage != null);

  InitialStateType type;
  String? errorMessage;
}
