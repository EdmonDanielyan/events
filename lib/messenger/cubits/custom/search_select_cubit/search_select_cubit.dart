import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ink_mobile/messenger/cubits/custom/search_select_cubit/search_select_state.dart';

class SearchSelectCubit<T> extends Cubit<SearchSelectState<T>> {
  SearchSelectCubit() : super(SearchSelectState(items: []));

  int get currentIndex => state.currentIndex;
  List<T> get items => state.items;

  bool isSelected(T item) {
    if (items.isNotEmpty && items.length - 1 >= currentIndex) {
      return item == items[currentIndex];
    }

    return false;
  }

  T? currentItem() {
    if (items.isNotEmpty && items.length - 1 >= currentIndex) {
      return items[currentIndex];
    }

    return null;
  }

  void enable(bool enable) {
    emit(state.copyWith(
      enabled: enable,
      items: [],
    ));
  }

  void setItems(List<T> items) {
    emit(state.copyWith(
      items: items,
      currentIndex: items.length - 1,
    ));
  }

  void toPrevious() {
    final index = currentIndex - 1;
    if (index >= 0) {
      emit(state.copyWith(currentIndex: index));
    }
  }

  void toNext() {
    final index = currentIndex + 1;
    if (index <= items.length - 1) {
      emit(state.copyWith(currentIndex: index));
    }
  }
}
