import 'package:flutter/material.dart';

enum OpenUniversityStateType {
  ABOUT_PROJECT,
  EVENTS,
  INK_LITERACY,
  LEARNING_MATERIALS,
  ERROR
}

@immutable
class OpenUniversityState {
  final List<dynamic>? data;
  final OpenUniversityStateType type;

  const OpenUniversityState({required this.type, this.data});
}
