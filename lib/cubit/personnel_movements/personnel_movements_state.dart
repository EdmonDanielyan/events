import 'package:flutter/material.dart';
import 'package:ink_mobile/models/movements_data.dart';

enum PersonnelMovementsStateType {LOADING, LOADED, EMPTY, ERROR}

@immutable
class PersonnelMovementsState
{
  final List<MovementsData>? data;
  final PersonnelMovementsStateType type;
  final String? errorMessage;

  PersonnelMovementsState({
    required this.type,
    this.data,
    this.errorMessage
  }) : assert(
    type != PersonnelMovementsStateType.ERROR
    || errorMessage != null,
    'errorMessage must not be null in error state'
  );
}