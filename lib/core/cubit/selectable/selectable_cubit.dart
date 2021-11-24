import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ink_mobile/core/cubit/selectable/selectable_state.dart';

@injectable
class SelectableCubit<T> extends Cubit<SelectableCubitState<T>> {
  SelectableCubit() : super(SelectableCubitState<T>(items: []));

  List<T> get getItems => state.items;

  bool isItemExists(T item) => getItems.contains(item);

  void clearAll() {
    _emitItems([]);
  }

  void addOrRemove(T item) {
    if (isItemExists(item)) {
      removeItem(item);
    } else {
      addItem(item);
    }
  }

  void addItem(T item) {
    List<T> items = getItems..add(item);
    _emitItems(items);
  }

  void removeItem(T item) {
    List<T> items = getItems;
    items.removeWhere((element) => element == item);
    _emitItems(items);
  }

  void _emitItems(List<T> items) {
    emit(state.copyWith(items: items));
  }
}
