
enum MainPageStateType {LOADING, LOADED, ERROR}

class MainPageState {
  final MainPageStateType type;
  final String errorMessage;

  MainPageState({required this.type, this.errorMessage = 'Отсутствует подключение к интернету'});
}