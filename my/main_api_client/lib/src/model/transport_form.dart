//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'transport_form.g.dart';

/// TransportForm
///
/// Properties:
/// * [ID] 
/// * [title] 
@BuiltValue()
abstract class TransportForm implements Built<TransportForm, TransportFormBuilder> {
  @BuiltValueField(wireName: r'ID')
  int? get ID;

  @BuiltValueField(wireName: r'title')
  String? get title;

  TransportForm._();

  factory TransportForm([void updates(TransportFormBuilder b)]) = _$TransportForm;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TransportFormBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TransportForm> get serializer => _$TransportFormSerializer();
}

class _$TransportFormSerializer implements PrimitiveSerializer<TransportForm> {
  @override
  final Iterable<Type> types = const [TransportForm, _$TransportForm];

  @override
  final String wireName = r'TransportForm';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TransportForm object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.ID != null) {
      yield r'ID';
      yield serializers.serialize(
        object.ID,
        specifiedType: const FullType(int),
      );
    }
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TransportForm object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TransportFormBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'ID':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.ID = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TransportForm deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TransportFormBuilder();
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

