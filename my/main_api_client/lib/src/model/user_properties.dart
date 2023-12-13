//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_properties.g.dart';

/// UserProperties
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [secondName] 
/// * [lastName] 
/// * [workPosition] 
/// * [workCity] 
/// * [birthday] 
/// * [birthdayString] 
/// * [avatar] 
@BuiltValue()
abstract class UserProperties implements Built<UserProperties, UserPropertiesBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'second_name')
  String? get secondName;

  @BuiltValueField(wireName: r'last_name')
  String? get lastName;

  @BuiltValueField(wireName: r'work_position')
  String? get workPosition;

  @BuiltValueField(wireName: r'work_city')
  String? get workCity;

  @BuiltValueField(wireName: r'birthday')
  DateTime? get birthday;

  @BuiltValueField(wireName: r'birthday_string')
  String? get birthdayString;

  @BuiltValueField(wireName: r'avatar')
  String? get avatar;

  UserProperties._();

  factory UserProperties([void updates(UserPropertiesBuilder b)]) = _$UserProperties;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserPropertiesBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserProperties> get serializer => _$UserPropertiesSerializer();
}

class _$UserPropertiesSerializer implements PrimitiveSerializer<UserProperties> {
  @override
  final Iterable<Type> types = const [UserProperties, _$UserProperties];

  @override
  final String wireName = r'UserProperties';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserProperties object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'name';
    yield object.name == null ? null : serializers.serialize(
      object.name,
      specifiedType: const FullType.nullable(String),
    );
    yield r'second_name';
    yield object.secondName == null ? null : serializers.serialize(
      object.secondName,
      specifiedType: const FullType.nullable(String),
    );
    yield r'last_name';
    yield object.lastName == null ? null : serializers.serialize(
      object.lastName,
      specifiedType: const FullType.nullable(String),
    );
    yield r'work_position';
    yield object.workPosition == null ? null : serializers.serialize(
      object.workPosition,
      specifiedType: const FullType.nullable(String),
    );
    yield r'work_city';
    yield object.workCity == null ? null : serializers.serialize(
      object.workCity,
      specifiedType: const FullType.nullable(String),
    );
    yield r'birthday';
    yield object.birthday == null ? null : serializers.serialize(
      object.birthday,
      specifiedType: const FullType.nullable(DateTime),
    );
    if (object.birthdayString != null) {
      yield r'birthday_string';
      yield serializers.serialize(
        object.birthdayString,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'avatar';
    yield object.avatar == null ? null : serializers.serialize(
      object.avatar,
      specifiedType: const FullType.nullable(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    UserProperties object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserPropertiesBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'second_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.secondName = valueDes;
          break;
        case r'last_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.lastName = valueDes;
          break;
        case r'work_position':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.workPosition = valueDes;
          break;
        case r'work_city':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.workCity = valueDes;
          break;
        case r'birthday':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.birthday = valueDes;
          break;
        case r'birthday_string':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.birthdayString = valueDes;
          break;
        case r'avatar':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.avatar = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserProperties deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserPropertiesBuilder();
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

