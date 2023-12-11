//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'auto_fill_form.g.dart';

/// AutoFillForm
///
/// Properties:
/// * [fio] 
/// * [position] 
/// * [organisation] 
/// * [organisationId] 
/// * [department] 
/// * [departmentId] 
/// * [email] 
/// * [birthday] 
/// * [personalPhone] 
@BuiltValue()
abstract class AutoFillForm implements Built<AutoFillForm, AutoFillFormBuilder> {
  @BuiltValueField(wireName: r'fio')
  String? get fio;

  @BuiltValueField(wireName: r'position')
  String? get position;

  @BuiltValueField(wireName: r'organisation')
  String? get organisation;

  @BuiltValueField(wireName: r'organisation_id')
  int? get organisationId;

  @BuiltValueField(wireName: r'department')
  String? get department;

  @BuiltValueField(wireName: r'department_id')
  int? get departmentId;

  @BuiltValueField(wireName: r'email')
  String? get email;

  @BuiltValueField(wireName: r'birthday')
  String? get birthday;

  @BuiltValueField(wireName: r'personalPhone')
  String? get personalPhone;

  AutoFillForm._();

  factory AutoFillForm([void updates(AutoFillFormBuilder b)]) = _$AutoFillForm;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AutoFillFormBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AutoFillForm> get serializer => _$AutoFillFormSerializer();
}

class _$AutoFillFormSerializer implements PrimitiveSerializer<AutoFillForm> {
  @override
  final Iterable<Type> types = const [AutoFillForm, _$AutoFillForm];

  @override
  final String wireName = r'AutoFillForm';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AutoFillForm object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.fio != null) {
      yield r'fio';
      yield serializers.serialize(
        object.fio,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.position != null) {
      yield r'position';
      yield serializers.serialize(
        object.position,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.organisation != null) {
      yield r'organisation';
      yield serializers.serialize(
        object.organisation,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.organisationId != null) {
      yield r'organisation_id';
      yield serializers.serialize(
        object.organisationId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.department != null) {
      yield r'department';
      yield serializers.serialize(
        object.department,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.departmentId != null) {
      yield r'department_id';
      yield serializers.serialize(
        object.departmentId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.birthday != null) {
      yield r'birthday';
      yield serializers.serialize(
        object.birthday,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.personalPhone != null) {
      yield r'personalPhone';
      yield serializers.serialize(
        object.personalPhone,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AutoFillForm object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AutoFillFormBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'fio':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.fio = valueDes;
          break;
        case r'position':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.position = valueDes;
          break;
        case r'organisation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.organisation = valueDes;
          break;
        case r'organisation_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.organisationId = valueDes;
          break;
        case r'department':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.department = valueDes;
          break;
        case r'department_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.departmentId = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.email = valueDes;
          break;
        case r'birthday':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.birthday = valueDes;
          break;
        case r'personalPhone':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.personalPhone = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AutoFillForm deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AutoFillFormBuilder();
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

