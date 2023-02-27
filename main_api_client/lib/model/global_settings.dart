//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.6

// ignore_for_file: unused_import

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'global_settings.g.dart';

abstract class GlobalSettings
    implements Built<GlobalSettings, GlobalSettingsBuilder> {
  /// Список названий компаний, для которых доступен сервис заказа справок
  @nullable
  @BuiltValueField(wireName: r'inquire_service_allowed_to')
  BuiltList<String> get inquireServiceAllowedTo;

  // Boilerplate code needed to wire-up generated code
  GlobalSettings._();

  static void _initializeBuilder(GlobalSettingsBuilder b) => b;

  factory GlobalSettings([void updates(GlobalSettingsBuilder b)]) =
      _$GlobalSettings;
  static Serializer<GlobalSettings> get serializer =>
      _$globalSettingsSerializer;
}
