//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/contacts_property_absence_inner.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'contacts_property.g.dart';

/// ContactsProperty
///
/// Properties:
/// * [id] 
/// * [lastName] 
/// * [name] 
/// * [secondName] 
/// * [photo] 
/// * [isMobileUser] 
/// * [workPosition] 
/// * [city] 
/// * [street] 
/// * [birthday] 
/// * [absence] 
@BuiltValue()
abstract class ContactsProperty implements Built<ContactsProperty, ContactsPropertyBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'last_name')
  String get lastName;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'second_name')
  String? get secondName;

  @BuiltValueField(wireName: r'photo')
  String? get photo;

  @BuiltValueField(wireName: r'is_mobile_user')
  bool get isMobileUser;

  @BuiltValueField(wireName: r'work_position')
  String? get workPosition;

  @BuiltValueField(wireName: r'city')
  String? get city;

  @BuiltValueField(wireName: r'street')
  String? get street;

  @BuiltValueField(wireName: r'birthday')
  DateTime? get birthday;

  @BuiltValueField(wireName: r'absence')
  BuiltList<ContactsPropertyAbsenceInner>? get absence;

  ContactsProperty._();

  factory ContactsProperty([void updates(ContactsPropertyBuilder b)]) = _$ContactsProperty;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ContactsPropertyBuilder b) => b
      ..isMobileUser = false;

  @BuiltValueSerializer(custom: true)
  static Serializer<ContactsProperty> get serializer => _$ContactsPropertySerializer();
}

class _$ContactsPropertySerializer implements PrimitiveSerializer<ContactsProperty> {
  @override
  final Iterable<Type> types = const [ContactsProperty, _$ContactsProperty];

  @override
  final String wireName = r'ContactsProperty';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ContactsProperty object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'last_name';
    yield serializers.serialize(
      object.lastName,
      specifiedType: const FullType(String),
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
    yield r'photo';
    yield object.photo == null ? null : serializers.serialize(
      object.photo,
      specifiedType: const FullType.nullable(String),
    );
    yield r'is_mobile_user';
    yield serializers.serialize(
      object.isMobileUser,
      specifiedType: const FullType(bool),
    );
    if (object.workPosition != null) {
      yield r'work_position';
      yield serializers.serialize(
        object.workPosition,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.city != null) {
      yield r'city';
      yield serializers.serialize(
        object.city,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.street != null) {
      yield r'street';
      yield serializers.serialize(
        object.street,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.birthday != null) {
      yield r'birthday';
      yield serializers.serialize(
        object.birthday,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.absence != null) {
      yield r'absence';
      yield serializers.serialize(
        object.absence,
        specifiedType: const FullType.nullable(BuiltList, [FullType(ContactsPropertyAbsenceInner)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ContactsProperty object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ContactsPropertyBuilder result,
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
        case r'last_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.lastName = valueDes;
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
        case r'photo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.photo = valueDes;
          break;
        case r'is_mobile_user':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isMobileUser = valueDes;
          break;
        case r'work_position':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.workPosition = valueDes;
          break;
        case r'city':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.city = valueDes;
          break;
        case r'street':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.street = valueDes;
          break;
        case r'birthday':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.birthday = valueDes;
          break;
        case r'absence':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(ContactsPropertyAbsenceInner)]),
          ) as BuiltList<ContactsPropertyAbsenceInner>?;
          if (valueDes == null) continue;
          result.absence.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ContactsProperty deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ContactsPropertyBuilder();
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

