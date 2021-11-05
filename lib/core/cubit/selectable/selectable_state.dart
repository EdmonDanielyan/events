class SelectableCubitState<T> {
  final List<T> items;

  const SelectableCubitState({
    required this.items,
  });

  SelectableCubitState<T> copyWith({
    List<T>? items,
  }) {
    return SelectableCubitState<T>(
      items: items ?? this.items,
    );
  }
}
