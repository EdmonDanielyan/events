//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'contacts_property_absence.g.dart';

abstract class ContactsPropertyAbsence
    implements Built<ContactsPropertyAbsence, ContactsPropertyAbsenceBuilder> {
  @nullable
  @BuiltValueField(wireName: r'user_id')
  int get userId;

  @nullable
  @BuiltValueField(wireName: r'reason')
  String get reason;

  @nullable
  @BuiltValueField(wireName: r'type')
  String get type;

  @nullable
  @BuiltValueField(wireName: r'from')
  DateTime get from;

  @nullable
  @BuiltValueField(wireName: r'to')
  DateTime get to;

  // Boilerplate code needed to wire-up generated code
  ContactsPropertyAbsence._();

  static void _initializeBuilder(ContactsPropertyAbsenceBuilder b) => b;

  factory ContactsPropertyAbsence(
          [void updates(ContactsPropertyAbsenceBuilder b)]) =
      _$ContactsPropertyAbsence;
  static Serializer<ContactsPropertyAbsence> get serializer =>
      _$contactsPropertyAbsenceSerializer;
}
