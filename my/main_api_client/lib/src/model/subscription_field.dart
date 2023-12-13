//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'subscription_field.g.dart';

/// параметры поля универсальной записи
///
/// Properties:
/// * [title] - Заголовок
/// * [code] - Код
/// * [type] - Тип
/// * [req] - Обязательное
/// * [params] - Доп. параметры, зависящие от типа поля
@BuiltValue()
abstract class SubscriptionField implements Built<SubscriptionField, SubscriptionFieldBuilder> {
  /// Заголовок
  @BuiltValueField(wireName: r'title')
  String? get title;

  /// Код
  @BuiltValueField(wireName: r'code')
  String? get code;

  /// Тип
  @BuiltValueField(wireName: r'type')
  SubscriptionFieldTypeEnum? get type;
  // enum typeEnum {  string,  dictionary,  int,  date,  };

  /// Обязательное
  @BuiltValueField(wireName: r'req')
  bool? get req;

  /// Доп. параметры, зависящие от типа поля
  @BuiltValueField(wireName: r'params')
  JsonObject? get params;

  SubscriptionField._();

  factory SubscriptionField([void updates(SubscriptionFieldBuilder b)]) = _$SubscriptionField;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SubscriptionFieldBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SubscriptionField> get serializer => _$SubscriptionFieldSerializer();
}

class _$SubscriptionFieldSerializer implements PrimitiveSerializer<SubscriptionField> {
  @override
  final Iterable<Type> types = const [SubscriptionField, _$SubscriptionField];

  @override
  final String wireName = r'SubscriptionField';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SubscriptionField object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType(String),
      );
    }
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
        specifiedType: const FullType(String),
      );
    }
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType(SubscriptionFieldTypeEnum),
      );
    }
    if (object.req != null) {
      yield r'req';
      yield serializers.serialize(
        object.req,
        specifiedType: const FullType(bool),
      );
    }
    if (object.params != null) {
      yield r'params';
      yield serializers.serialize(
        object.params,
        specifiedType: const FullType(JsonObject),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SubscriptionField object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SubscriptionFieldBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SubscriptionFieldTypeEnum),
          ) as SubscriptionFieldTypeEnum;
          result.type = valueDes;
          break;
        case r'req':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.req = valueDes;
          break;
        case r'params':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(JsonObject),
          ) as JsonObject;
          result.params = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SubscriptionField deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SubscriptionFieldBuilder();
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

class SubscriptionFieldTypeEnum extends EnumClass {

  /// Тип
  @BuiltValueEnumConst(wireName: r'string')
  static const SubscriptionFieldTypeEnum string = _$subscriptionFieldTypeEnum_string;
  /// Тип
  @BuiltValueEnumConst(wireName: r'dictionary')
  static const SubscriptionFieldTypeEnum dictionary = _$subscriptionFieldTypeEnum_dictionary;
  /// Тип
  @BuiltValueEnumConst(wireName: r'int')
  static const SubscriptionFieldTypeEnum int_ = _$subscriptionFieldTypeEnum_int_;
  /// Тип
  @BuiltValueEnumConst(wireName: r'date')
  static const SubscriptionFieldTypeEnum date = _$subscriptionFieldTypeEnum_date;

  static Serializer<SubscriptionFieldTypeEnum> get serializer => _$subscriptionFieldTypeEnumSerializer;

  const SubscriptionFieldTypeEnum._(String name): super(name);

  static BuiltSet<SubscriptionFieldTypeEnum> get values => _$subscriptionFieldTypeEnumValues;
  static SubscriptionFieldTypeEnum valueOf(String name) => _$subscriptionFieldTypeEnumValueOf(name);
}

