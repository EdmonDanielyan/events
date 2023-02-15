//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:main_api_client/model/global_settings.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'global_settings_response_body_all_of.g.dart';

abstract class GlobalSettingsResponseBodyAllOf
    implements
        Built<GlobalSettingsResponseBodyAllOf,
            GlobalSettingsResponseBodyAllOfBuilder> {
  @nullable
  @BuiltValueField(wireName: r'data')
  GlobalSettings get data;

  // Boilerplate code needed to wire-up generated code
  GlobalSettingsResponseBodyAllOf._();

  static void _initializeBuilder(GlobalSettingsResponseBodyAllOfBuilder b) => b;

  factory GlobalSettingsResponseBodyAllOf(
          [void updates(GlobalSettingsResponseBodyAllOfBuilder b)]) =
      _$GlobalSettingsResponseBodyAllOf;
  static Serializer<GlobalSettingsResponseBodyAllOf> get serializer =>
      _$globalSettingsResponseBodyAllOfSerializer;
}
