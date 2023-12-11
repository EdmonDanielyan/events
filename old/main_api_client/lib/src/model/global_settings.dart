//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'global_settings.g.dart';

/// Глобальный объект настроек, должен дописываться по мерепоявления новых параметров
///
/// Properties:
/// * [inquireServiceAllowedTo] - Список названий компаний, для которых доступен сервис заказа справок
@BuiltValue()
abstract class GlobalSettings implements Built<GlobalSettings, GlobalSettingsBuilder> {
  /// Список названий компаний, для которых доступен сервис заказа справок
  @BuiltValueField(wireName: r'inquire_service_allowed_to')
  BuiltList<String>? get inquireServiceAllowedTo;

  GlobalSettings._();

  factory GlobalSettings([void updates(GlobalSettingsBuilder b)]) = _$GlobalSettings;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GlobalSettingsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GlobalSettings> get serializer => _$GlobalSettingsSerializer();
}

class _$GlobalSettingsSerializer implements PrimitiveSerializer<GlobalSettings> {
  @override
  final Iterable<Type> types = const [GlobalSettings, _$GlobalSettings];

  @override
  final String wireName = r'GlobalSettings';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GlobalSettings object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.inquireServiceAllowedTo != null) {
      yield r'inquire_service_allowed_to';
      yield serializers.serialize(
        object.inquireServiceAllowedTo,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GlobalSettings object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GlobalSettingsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'inquire_service_allowed_to':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.inquireServiceAllowedTo.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GlobalSettings deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GlobalSettingsBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

