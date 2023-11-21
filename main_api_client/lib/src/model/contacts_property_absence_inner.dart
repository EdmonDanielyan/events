//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'contacts_property_absence_inner.g.dart';

/// ContactsPropertyAbsenceInner
///
/// Properties:
/// * [userId] 
/// * [reason] 
/// * [type] 
/// * [from] 
/// * [to] 
@BuiltValue()
abstract class ContactsPropertyAbsenceInner implements Built<ContactsPropertyAbsenceInner, ContactsPropertyAbsenceInnerBuilder> {
  @BuiltValueField(wireName: r'user_id')
  int? get userId;

  @BuiltValueField(wireName: r'reason')
  String? get reason;

  @BuiltValueField(wireName: r'type')
  String? get type;

  @BuiltValueField(wireName: r'from')
  DateTime? get from;

  @BuiltValueField(wireName: r'to')
  DateTime? get to;

  ContactsPropertyAbsenceInner._();

  factory ContactsPropertyAbsenceInner([void updates(ContactsPropertyAbsenceInnerBuilder b)]) = _$ContactsPropertyAbsenceInner;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ContactsPropertyAbsenceInnerBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ContactsPropertyAbsenceInner> get serializer => _$ContactsPropertyAbsenceInnerSerializer();
}

class _$ContactsPropertyAbsenceInnerSerializer implements PrimitiveSerializer<ContactsPropertyAbsenceInner> {
  @override
  final Iterable<Type> types = const [ContactsPropertyAbsenceInner, _$ContactsPropertyAbsenceInner];

  @override
  final String wireName = r'ContactsPropertyAbsenceInner';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ContactsPropertyAbsenceInner object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.userId != null) {
      yield r'user_id';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType(int),
      );
    }
    if (object.reason != null) {
      yield r'reason';
      yield serializers.serialize(
        object.reason,
        specifiedType: const FullType(String),
      );
    }
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.from != null) {
      yield r'from';
      yield serializers.serialize(
        object.from,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.to != null) {
      yield r'to';
      yield serializers.serialize(
        object.to,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ContactsPropertyAbsenceInner object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ContactsPropertyAbsenceInnerBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.userId = valueDes;
          break;
        case r'reason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.reason = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.type = valueDes;
          break;
        case r'from':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.from = valueDes;
          break;
        case r'to':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.to = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ContactsPropertyAbsenceInner deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ContactsPropertyAbsenceInnerBuilder();
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

