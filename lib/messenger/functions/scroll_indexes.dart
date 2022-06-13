class ScrollIndexes {
  final Map<String, int> _indexes = {};

  void add(String id, int index) {
    _indexes[id] = index;
  }

  bool contains(String id) {
    return _indexes.containsKey(id);
  }

  int? getIndex(String id) {
    if (_indexes.containsKey(id)) {
      return _indexes[id];
    }

    return null;
  }
}
