//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/contacts_property_absence.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'contacts_property.g.dart';

abstract class ContactsProperty
    implements Built<ContactsProperty, ContactsPropertyBuilder> {
  @nullable
  @BuiltValueField(wireName: r'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: r'last_name')
  String get lastName;

  @nullable
  @BuiltValueField(wireName: r'name')
  String get name;

  @nullable
  @BuiltValueField(wireName: r'second_name')
  String get secondName;

  @nullable
  @BuiltValueField(wireName: r'photo')
  String get photo;

  @nullable
  @BuiltValueField(wireName: r'is_mobile_user')
  bool get isMobileUser;

  @nullable
  @BuiltValueField(wireName: r'work_position')
  String get workPosition;

  @nullable
  @BuiltValueField(wireName: r'city')
  String get city;

  @nullable
  @BuiltValueField(wireName: r'street')
  String get street;

  @nullable
  @BuiltValueField(wireName: r'birthday')
  DateTime get birthday;

  @nullable
  @BuiltValueField(wireName: r'absence')
  BuiltList<ContactsPropertyAbsence> get absence;

  // Boilerplate code needed to wire-up generated code
  ContactsProperty._();

  static void _initializeBuilder(ContactsPropertyBuilder b) => b
    ..name = 'null'
    ..secondName = 'null'
    ..photo = 'null'
    ..isMobileUser = false
    ..workPosition = 'null'
    ..city = 'null'
    ..street = 'null';

  factory ContactsProperty([void updates(ContactsPropertyBuilder b)]) =
      _$ContactsProperty;
  static Serializer<ContactsProperty> get serializer =>
      _$contactsPropertySerializer;
}
