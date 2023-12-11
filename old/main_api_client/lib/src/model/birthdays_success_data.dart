//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/user_properties.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'birthdays_success_data.g.dart';

/// BirthdaysSuccessData
///
/// Properties:
/// * [others] 
/// * [today] 
@BuiltValue()
abstract class BirthdaysSuccessData implements Built<BirthdaysSuccessData, BirthdaysSuccessDataBuilder> {
  @BuiltValueField(wireName: r'others')
  BuiltList<UserProperties>? get others;

  @BuiltValueField(wireName: r'today')
  BuiltList<UserProperties>? get today;

  BirthdaysSuccessData._();

  factory BirthdaysSuccessData([void updates(BirthdaysSuccessDataBuilder b)]) = _$BirthdaysSuccessData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BirthdaysSuccessDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BirthdaysSuccessData> get serializer => _$BirthdaysSuccessDataSerializer();
}

class _$BirthdaysSuccessDataSerializer implements PrimitiveSerializer<BirthdaysSuccessData> {
  @override
  final Iterable<Type> types = const [BirthdaysSuccessData, _$BirthdaysSuccessData];

  @override
  final String wireName = r'BirthdaysSuccessData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BirthdaysSuccessData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.others != null) {
      yield r'others';
      yield serializers.serialize(
        object.others,
        specifiedType: const FullType(BuiltList, [FullType(UserProperties)]),
      );
    }
    if (object.today != null) {
      yield r'today';
      yield serializers.serialize(
        object.today,
        specifiedType: const FullType(BuiltList, [FullType(UserProperties)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BirthdaysSuccessData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BirthdaysSuccessDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'others':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(UserProperties)]),
          ) as BuiltList<UserProperties>;
          result.others.replace(valueDes);
          break;
        case r'today':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(UserProperties)]),
          ) as BuiltList<UserProperties>;
          result.today.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BirthdaysSuccessData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BirthdaysSuccessDataBuilder();
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

