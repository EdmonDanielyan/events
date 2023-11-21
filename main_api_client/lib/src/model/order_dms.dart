//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'order_dms.g.dart';

/// OrderDMS
///
/// Properties:
/// * [dmsType] 
/// * [lastName] 
/// * [firstName] 
/// * [secondName] 
/// * [birthday] 
/// * [organisationId] - ID организации, справочник /directory/organisation.
/// * [workPosition] 
/// * [phone] 
/// * [email] 
/// * [additionalInformation] 
/// * [dentalSelect] 
/// * [specSelect] 
/// * [labSelect] 
/// * [otherSelect] 
/// * [specText] 
/// * [labText] 
/// * [otherText] 
/// * [clinic] 
/// * [city] 
/// * [address] 
/// * [money] 
/// * [date] 
/// * [dateTo] 
@BuiltValue()
abstract class OrderDMS implements Built<OrderDMS, OrderDMSBuilder> {
  @BuiltValueField(wireName: r'dms_type')
  String get dmsType;

  @BuiltValueField(wireName: r'last_name')
  String get lastName;

  @BuiltValueField(wireName: r'first_name')
  String get firstName;

  @BuiltValueField(wireName: r'second_name')
  String get secondName;

  @BuiltValueField(wireName: r'birthday')
  String get birthday;

  /// ID организации, справочник /directory/organisation.
  @BuiltValueField(wireName: r'organisation_id')
  num? get organisationId;

  @BuiltValueField(wireName: r'work_position')
  String get workPosition;

  @BuiltValueField(wireName: r'phone')
  String get phone;

  @BuiltValueField(wireName: r'email')
  String get email;

  @BuiltValueField(wireName: r'additional_information')
  String? get additionalInformation;

  @BuiltValueField(wireName: r'dental_select')
  bool? get dentalSelect;

  @BuiltValueField(wireName: r'spec_select')
  bool? get specSelect;

  @BuiltValueField(wireName: r'lab_select')
  bool? get labSelect;

  @BuiltValueField(wireName: r'other_select')
  bool? get otherSelect;

  @BuiltValueField(wireName: r'spec_text')
  String? get specText;

  @BuiltValueField(wireName: r'lab_text')
  String? get labText;

  @BuiltValueField(wireName: r'other_text')
  String? get otherText;

  @BuiltValueField(wireName: r'clinic')
  String? get clinic;

  @BuiltValueField(wireName: r'city')
  String? get city;

  @BuiltValueField(wireName: r'address')
  String? get address;

  @BuiltValueField(wireName: r'money')
  String? get money;

  @BuiltValueField(wireName: r'date')
  String? get date;

  @BuiltValueField(wireName: r'date_to')
  String? get dateTo;

  OrderDMS._();

  factory OrderDMS([void updates(OrderDMSBuilder b)]) = _$OrderDMS;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OrderDMSBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OrderDMS> get serializer => _$OrderDMSSerializer();
}

class _$OrderDMSSerializer implements PrimitiveSerializer<OrderDMS> {
  @override
  final Iterable<Type> types = const [OrderDMS, _$OrderDMS];

  @override
  final String wireName = r'OrderDMS';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OrderDMS object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'dms_type';
    yield serializers.serialize(
      object.dmsType,
      specifiedType: const FullType(String),
    );
    yield r'last_name';
    yield serializers.serialize(
      object.lastName,
      specifiedType: const FullType(String),
    );
    yield r'first_name';
    yield serializers.serialize(
      object.firstName,
      specifiedType: const FullType(String),
    );
    yield r'second_name';
    yield serializers.serialize(
      object.secondName,
      specifiedType: const FullType(String),
    );
    yield r'birthday';
    yield serializers.serialize(
      object.birthday,
      specifiedType: const FullType(String),
    );
    if (object.organisationId != null) {
      yield r'organisation_id';
      yield serializers.serialize(
        object.organisationId,
        specifiedType: const FullType(num),
      );
    }
    yield r'work_position';
    yield serializers.serialize(
      object.workPosition,
      specifiedType: const FullType(String),
    );
    yield r'phone';
    yield serializers.serialize(
      object.phone,
      specifiedType: const FullType(String),
    );
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
    if (object.additionalInformation != null) {
      yield r'additional_information';
      yield serializers.serialize(
        object.additionalInformation,
        specifiedType: const FullType(String),
      );
    }
    if (object.dentalSelect != null) {
      yield r'dental_select';
      yield serializers.serialize(
        object.dentalSelect,
        specifiedType: const FullType(bool),
      );
    }
    if (object.specSelect != null) {
      yield r'spec_select';
      yield serializers.serialize(
        object.specSelect,
        specifiedType: const FullType(bool),
      );
    }
    if (object.labSelect != null) {
      yield r'lab_select';
      yield serializers.serialize(
        object.labSelect,
        specifiedType: const FullType(bool),
      );
    }
    if (object.otherSelect != null) {
      yield r'other_select';
      yield serializers.serialize(
        object.otherSelect,
        specifiedType: const FullType(bool),
      );
    }
    if (object.specText != null) {
      yield r'spec_text';
      yield serializers.serialize(
        object.specText,
        specifiedType: const FullType(String),
      );
    }
    if (object.labText != null) {
      yield r'lab_text';
      yield serializers.serialize(
        object.labText,
        specifiedType: const FullType(String),
      );
    }
    if (object.otherText != null) {
      yield r'other_text';
      yield serializers.serialize(
        object.otherText,
        specifiedType: const FullType(String),
      );
    }
    if (object.clinic != null) {
      yield r'clinic';
      yield serializers.serialize(
        object.clinic,
        specifiedType: const FullType(String),
      );
    }
    if (object.city != null) {
      yield r'city';
      yield serializers.serialize(
        object.city,
        specifiedType: const FullType(String),
      );
    }
    if (object.address != null) {
      yield r'address';
      yield serializers.serialize(
        object.address,
        specifiedType: const FullType(String),
      );
    }
    if (object.money != null) {
      yield r'money';
      yield serializers.serialize(
        object.money,
        specifiedType: const FullType(String),
      );
    }
    if (object.date != null) {
      yield r'date';
      yield serializers.serialize(
        object.date,
        specifiedType: const FullType(String),
      );
    }
    if (object.dateTo != null) {
      yield r'date_to';
      yield serializers.serialize(
        object.dateTo,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    OrderDMS object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required OrderDMSBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'dms_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.dmsType = valueDes;
          break;
        case r'last_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.lastName = valueDes;
          break;
        case r'first_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.firstName = valueDes;
          break;
        case r'second_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.secondName = valueDes;
          break;
        case r'birthday':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.birthday = valueDes;
          break;
        case r'organisation_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.organisationId = valueDes;
          break;
        case r'work_position':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.workPosition = valueDes;
          break;
        case r'phone':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.phone = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'additional_information':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.additionalInformation = valueDes;
          break;
        case r'dental_select':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.dentalSelect = valueDes;
          break;
        case r'spec_select':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.specSelect = valueDes;
          break;
        case r'lab_select':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.labSelect = valueDes;
          break;
        case r'other_select':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.otherSelect = valueDes;
          break;
        case r'spec_text':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.specText = valueDes;
          break;
        case r'lab_text':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.labText = valueDes;
          break;
        case r'other_text':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.otherText = valueDes;
          break;
        case r'clinic':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.clinic = valueDes;
          break;
        case r'city':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.city = valueDes;
          break;
        case r'address':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.address = valueDes;
          break;
        case r'money':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.money = valueDes;
          break;
        case r'date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.date = valueDes;
          break;
        case r'date_to':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.dateTo = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  OrderDMS deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OrderDMSBuilder();
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

