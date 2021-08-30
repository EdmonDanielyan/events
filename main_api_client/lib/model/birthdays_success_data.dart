//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/user_properties.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'birthdays_success_data.g.dart';

abstract class BirthdaysSuccessData
    implements Built<BirthdaysSuccessData, BirthdaysSuccessDataBuilder> {
  @nullable
  @BuiltValueField(wireName: r'others')
  BuiltList<UserProperties> get others;

  @nullable
  @BuiltValueField(wireName: r'today')
  BuiltList<UserProperties> get today;

  // Boilerplate code needed to wire-up generated code
  BirthdaysSuccessData._();

  static void _initializeBuilder(BirthdaysSuccessDataBuilder b) => b;

  factory BirthdaysSuccessData([void updates(BirthdaysSuccessDataBuilder b)]) =
      _$BirthdaysSuccessData;
  static Serializer<BirthdaysSuccessData> get serializer =>
      _$birthdaysSuccessDataSerializer;
}
