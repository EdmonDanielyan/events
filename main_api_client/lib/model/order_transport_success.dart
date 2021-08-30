//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/required_success.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'order_transport_success.g.dart';

abstract class OrderTransportSuccess
    implements Built<OrderTransportSuccess, OrderTransportSuccessBuilder> {
  @nullable
  @BuiltValueField(wireName: r'data')
  String get data;

  @nullable
  @BuiltValueField(wireName: r'success')
  bool get success;

  @nullable
  @BuiltValueField(wireName: r'host')
  String get host;

  @nullable
  @BuiltValueField(wireName: r'version')
  String get version;

  @nullable
  @BuiltValueField(wireName: r'returned')
  DateTime get returned;

  @nullable
  @BuiltValueField(wireName: r'status')
  int get status;

  // Boilerplate code needed to wire-up generated code
  OrderTransportSuccess._();

  static void _initializeBuilder(OrderTransportSuccessBuilder b) => b
    ..success = true
    ..host = 'https://example.com'
    ..version = '1.0.0'
    ..status = 200;

  factory OrderTransportSuccess(
      [void updates(OrderTransportSuccessBuilder b)]) = _$OrderTransportSuccess;
  static Serializer<OrderTransportSuccess> get serializer =>
      _$orderTransportSuccessSerializer;
}
