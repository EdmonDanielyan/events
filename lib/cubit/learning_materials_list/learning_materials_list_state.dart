import 'package:flutter/material.dart';
import 'package:ink_mobile/models/learning_materials_data.dart';

enum LearningMaterialsListStateType {LOADING, LOADED, ERROR}

@immutable
class LearningMaterialsListState {
  final List<LearningMaterialsData>? data;
  final LearningMaterialsListStateType type;
  final String? errorMessage;

  LearningMaterialsListState({
    required this.type,
    this.data,
    this.errorMessage
  }) : assert(
    type != LearningMaterialsListStateType.ERROR
    || errorMessage != null,
    'errorMessage must not be null in error state'
  );
}