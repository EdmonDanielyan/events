import 'package:flutter/material.dart';
import 'package:ink_mobile/models/selectfield.dart';

class SelectfieldCubitState {
  final AutovalidateMode validateMode;
  final List<Selectfield> items;
  const SelectfieldCubitState({
    this.validateMode = AutovalidateMode.onUserInteraction,
    this.items = const [],
  });

  SelectfieldCubitState copyWith({
    AutovalidateMode? validateMode,
    List<Selectfield>? items,
  }) {
    return SelectfieldCubitState(
      validateMode: validateMode ?? this.validateMode,
      items: items ?? this.items,
    );
  }
}
