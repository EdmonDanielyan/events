//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_users.g.dart';

/// GetUsers
///
/// Properties:
/// * [users] 
@BuiltValue()
abstract class GetUsers implements Built<GetUsers, GetUsersBuilder> {
  @BuiltValueField(wireName: r'users')
  BuiltList<int> get users;

  GetUsers._();

  factory GetUsers([void updates(GetUsersBuilder b)]) = _$GetUsers;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetUsersBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetUsers> get serializer => _$GetUsersSerializer();
}

class _$GetUsersSerializer implements PrimitiveSerializer<GetUsers> {
  @override
  final Iterable<Type> types = const [GetUsers, _$GetUsers];

  @override
  final String wireName = r'GetUsers';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetUsers object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'users';
    yield serializers.serialize(
      object.users,
      specifiedType: const FullType(BuiltList, [FullType(int)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GetUsers object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetUsersBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'users':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(int)]),
          ) as BuiltList<int>;
          result.users.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GetUsers deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetUsersBuilder();
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

