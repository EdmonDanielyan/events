//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'order_reference.g.dart';

abstract class OrderReference
    implements Built<OrderReference, OrderReferenceBuilder> {
  @nullable
  @BuiltValueField(wireName: r'reference_type')
  String get referenceType;

  @nullable
  @BuiltValueField(wireName: r'phone')
  String get phone;

  @nullable
  @BuiltValueField(wireName: r'way')
  String get way;

  @nullable
  @BuiltValueField(wireName: r'postal_code')
  String get postalCode;

  @nullable
  @BuiltValueField(wireName: r'address')
  String get address;

  @nullable
  @BuiltValueField(wireName: r'period')
  String get period;

  @nullable
  @BuiltValueField(wireName: r'destination')
  String get destination;

  @nullable
  @BuiltValueField(wireName: r'num')
  int get num_;

  @nullable
  @BuiltValueField(wireName: r'child')
  String get child;

  @nullable
  @BuiltValueField(wireName: r'date_start')
  String get dateStart;

  @nullable
  @BuiltValueField(wireName: r'date_end')
  String get dateEnd;

  // Boilerplate code needed to wire-up generated code
  OrderReference._();

  static void _initializeBuilder(OrderReferenceBuilder b) => b
    ..referenceType =
        'employment_center, visa, sick_leave, income_2ndfl, income, child_allowance, child_allowance_1.5_years, FIFO, work_at_company, average_earnings, payroll_account, funds_withholding, labor_activity, employment_record'
    ..phone = '+71231234567'
    ..way = 'BUH, SECURITY_UK, OK_IRK, OK_UK, INKTKRS, POST';

  factory OrderReference([void updates(OrderReferenceBuilder b)]) =
      _$OrderReference;
  static Serializer<OrderReference> get serializer =>
      _$orderReferenceSerializer;
}
