import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_list_state.dart';

class SearchListCubit<T> extends Cubit<SearchListState<T>> {
  SearchListCubit() : super(SearchListState<T>(items: []));

  void setItems(String value, List<T> items) {
    emit(state.copyWith(items: items, value: value));
  }
}
