import 'package:flutter/foundation.dart';

class SearchSelectState<T> {
  final List<T> items;
  final int currentIndex;
  final bool enabled;
  SearchSelectState({
    this.items = const [],
    this.currentIndex = 0,
    this.enabled = false,
  });

  SearchSelectState<T> copyWith({
    List<T>? items,
    int? currentIndex,
    bool? enabled,
  }) {
    return SearchSelectState<T>(
      items: items ?? this.items,
      currentIndex: currentIndex ?? this.currentIndex,
      enabled: enabled ?? this.enabled,
    );
  }

  @override
  String toString() =>
      'SearchSelectState(items: $items, currentIndex: $currentIndex, enabled: $enabled)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SearchSelectState<T> &&
        listEquals(other.items, items) &&
        other.currentIndex == currentIndex &&
        other.enabled == enabled;
  }

  @override
  int get hashCode => items.hashCode ^ currentIndex.hashCode ^ enabled.hashCode;
}
