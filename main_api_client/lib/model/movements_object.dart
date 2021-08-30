//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'movements_object.g.dart';

abstract class MovementsObject
    implements Built<MovementsObject, MovementsObjectBuilder> {
  @nullable
  @BuiltValueField(wireName: r'period')
  String get period;

  @nullable
  @BuiltValueField(wireName: r'position')
  String get position;

  @nullable
  @BuiltValueField(wireName: r'department')
  String get department;

  @nullable
  @BuiltValueField(wireName: r'organization')
  String get organization;

  @nullable
  @BuiltValueField(wireName: r'operation')
  String get operation;

  @nullable
  @BuiltValueField(wireName: r'pnum')
  String get pnum;

  // Boilerplate code needed to wire-up generated code
  MovementsObject._();

  static void _initializeBuilder(MovementsObjectBuilder b) => b;

  factory MovementsObject([void updates(MovementsObjectBuilder b)]) =
      _$MovementsObject;
  static Serializer<MovementsObject> get serializer =>
      _$movementsObjectSerializer;
}
