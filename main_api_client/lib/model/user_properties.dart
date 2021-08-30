//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_properties.g.dart';

abstract class UserProperties
    implements Built<UserProperties, UserPropertiesBuilder> {
  @nullable
  @BuiltValueField(wireName: r'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: r'name')
  String get name;

  @nullable
  @BuiltValueField(wireName: r'second_name')
  String get secondName;

  @nullable
  @BuiltValueField(wireName: r'last_name')
  String get lastName;

  @nullable
  @BuiltValueField(wireName: r'work_position')
  String get workPosition;

  @nullable
  @BuiltValueField(wireName: r'work_city')
  String get workCity;

  @nullable
  @BuiltValueField(wireName: r'birthday')
  DateTime get birthday;

  @nullable
  @BuiltValueField(wireName: r'birthday_string')
  String get birthdayString;

  @nullable
  @BuiltValueField(wireName: r'avatar')
  String get avatar;

  // Boilerplate code needed to wire-up generated code
  UserProperties._();

  static void _initializeBuilder(UserPropertiesBuilder b) => b;

  factory UserProperties([void updates(UserPropertiesBuilder b)]) =
      _$UserProperties;
  static Serializer<UserProperties> get serializer =>
      _$userPropertiesSerializer;
}
