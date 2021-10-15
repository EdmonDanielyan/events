import 'package:flutter/foundation.dart';

class ItemsSearch<T> {
  int currentItemIndex;
  List<T> items;
  String searchValue;
  ItemsSearch({
    this.items = const [],
    this.searchValue = "",
    this.currentItemIndex = 0,
  }) {
    currentItemIndex = items.length - 1;
  }

  T get getCurrentItem => items[currentItemIndex];

  bool validateIndex(int newIndex) {
    return items.isNotEmpty && newIndex >= 0 && newIndex < items.length;
  }

  ItemsSearch<T> increaseIndexAndReturn() {
    int newIndex = currentItemIndex + 1;
    ItemsSearch<T> newItem = this;
    newItem.currentItemIndex =
        validateIndex(newIndex) ? newIndex : currentItemIndex;
    return newItem;
  }

  ItemsSearch<T> decreaseIndexAndReturn() {
    int newIndex = currentItemIndex - 1;
    ItemsSearch<T> newItem = this;
    newItem.currentItemIndex =
        validateIndex(newIndex) ? newIndex : currentItemIndex;
    return newItem;
  }

  ItemsSearch<T> copyWith({
    List<T>? items,
    String? searchValue,
    int? currentItemIndex,
  }) {
    return ItemsSearch(
      items: items ?? this.items,
      searchValue: searchValue ?? this.searchValue,
      currentItemIndex: currentItemIndex ?? this.currentItemIndex,
    );
  }

  @override
  String toString() => 'ItemsSearch(items: $items, searchValue: $searchValue)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ItemsSearch &&
        listEquals(other.items, items) &&
        other.searchValue == searchValue;
  }

  @override
  int get hashCode => items.hashCode ^ searchValue.hashCode;
}
