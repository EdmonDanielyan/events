enum ReferencesStateType { LOADING, INIT, PERMISSIONS_DENIED, ERROR }

class ReferencesPageState {
  final ReferencesStateType type;
  final String errorMessage;

  ReferencesPageState(
      {required this.type,
      this.errorMessage = 'Отсутствует подключение к интернету'});
}
