import 'package:flutter/foundation.dart';

class SearchListState<T> {
  final List<T> items;
  final String value;
  SearchListState({
    this.items = const [],
    this.value = '',
  });

  SearchListState<T> copyWith({
    List<T>? items,
    String? value,
  }) {
    return SearchListState<T>(
      items: items ?? this.items,
      value: value ?? this.value,
    );
  }

  @override
  String toString() => 'SearchListState(items: $items, value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchListState<T> &&
        listEquals(other.items, items) &&
        other.value == value;
  }

  @override
  int get hashCode => items.hashCode ^ value.hashCode;
}
