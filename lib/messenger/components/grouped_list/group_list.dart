import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';

class GroupList<T> {
  final List<T> items;
  final List<Key> keys;
  GroupList({
    required this.items,
    this.keys = const [],
  });

  GroupList<T> copyWith({
    List<T>? items,
    List<Key>? keys,
  }) {
    return GroupList<T>(
      items: items ?? this.items,
      keys: keys ?? this.keys,
    );
  }

  bool contains(T element) => items.contains(element);
  bool containsKey(Key key) => keys.contains(key);

  void add(T element) => items.add(element);
  void addKey(Key key) => keys.add(key);
  void remove(T element) => items.remove(element);

  @override
  String toString() => 'GroupList(items: $items, keys: $keys)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is GroupList<T> &&
        listEquals(other.items, items) &&
        listEquals(other.keys, keys);
  }

  @override
  int get hashCode => items.hashCode ^ keys.hashCode;
}
