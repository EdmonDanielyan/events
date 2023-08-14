//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'order_dms.g.dart';

abstract class OrderDMS implements Built<OrderDMS, OrderDMSBuilder> {
  @nullable
  @BuiltValueField(wireName: r'dms_type')
  String get dmsType;

  @nullable
  @BuiltValueField(wireName: r'last_name')
  String get lastName;

  @nullable
  @BuiltValueField(wireName: r'first_name')
  String get firstName;

  @nullable
  @BuiltValueField(wireName: r'second_name')
  String get secondName;

  @nullable
  @BuiltValueField(wireName: r'birthday')
  String get birthday;

  /// ID организации, справочник /directory/organisation.
  @nullable
  @BuiltValueField(wireName: r'organisation_id')
  num get organisationId;

  @nullable
  @BuiltValueField(wireName: r'work_position')
  String get workPosition;

  @nullable
  @BuiltValueField(wireName: r'phone')
  String get phone;

  @nullable
  @BuiltValueField(wireName: r'email')
  String get email;

  @nullable
  @BuiltValueField(wireName: r'additional_information')
  String get additionalInformation;

  @nullable
  @BuiltValueField(wireName: r'dental_select')
  bool get dentalSelect;

  @nullable
  @BuiltValueField(wireName: r'spec_select')
  bool get specSelect;

  @nullable
  @BuiltValueField(wireName: r'lab_select')
  bool get labSelect;

  @nullable
  @BuiltValueField(wireName: r'other_select')
  bool get otherSelect;

  @nullable
  @BuiltValueField(wireName: r'spec_text')
  String get specText;

  @nullable
  @BuiltValueField(wireName: r'lab_text')
  String get labText;

  @nullable
  @BuiltValueField(wireName: r'other_text')
  String get otherText;

  @nullable
  @BuiltValueField(wireName: r'clinic')
  String get clinic;

  @nullable
  @BuiltValueField(wireName: r'city')
  String get city;

  @nullable
  @BuiltValueField(wireName: r'address')
  String get address;

  @nullable
  @BuiltValueField(wireName: r'money')
  String get money;

  @nullable
  @BuiltValueField(wireName: r'date')
  String get date;

  @nullable
  @BuiltValueField(wireName: r'date_to')
  String get dateTo;

  // Boilerplate code needed to wire-up generated code
  OrderDMS._();

  static void _initializeBuilder(OrderDMSBuilder b) => b;

  factory OrderDMS([void updates(OrderDMSBuilder b)]) = _$OrderDMS;
  static Serializer<OrderDMS> get serializer => _$orderDMSSerializer;
}
