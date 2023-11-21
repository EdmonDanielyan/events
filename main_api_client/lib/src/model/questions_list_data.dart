//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'questions_list_data.g.dart';

/// QuestionsListData
///
/// Properties:
/// * [id] 
/// * [date] 
/// * [responsible] 
/// * [tags] 
/// * [question] 
/// * [answer] 
/// * [totalCount] 
/// * [next] 
/// * [prev] 
@BuiltValue()
abstract class QuestionsListData implements Built<QuestionsListData, QuestionsListDataBuilder> {
  @BuiltValueField(wireName: r'id')
  int? get id;

  @BuiltValueField(wireName: r'date')
  String? get date;

  @BuiltValueField(wireName: r'responsible')
  String? get responsible;

  @BuiltValueField(wireName: r'tags')
  String? get tags;

  @BuiltValueField(wireName: r'question')
  String? get question;

  @BuiltValueField(wireName: r'answer')
  String? get answer;

  @BuiltValueField(wireName: r'total_count')
  int? get totalCount;

  @BuiltValueField(wireName: r'next')
  String? get next;

  @BuiltValueField(wireName: r'prev')
  String? get prev;

  QuestionsListData._();

  factory QuestionsListData([void updates(QuestionsListDataBuilder b)]) = _$QuestionsListData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(QuestionsListDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<QuestionsListData> get serializer => _$QuestionsListDataSerializer();
}

class _$QuestionsListDataSerializer implements PrimitiveSerializer<QuestionsListData> {
  @override
  final Iterable<Type> types = const [QuestionsListData, _$QuestionsListData];

  @override
  final String wireName = r'QuestionsListData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    QuestionsListData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.date != null) {
      yield r'date';
      yield serializers.serialize(
        object.date,
        specifiedType: const FullType(String),
      );
    }
    if (object.responsible != null) {
      yield r'responsible';
      yield serializers.serialize(
        object.responsible,
        specifiedType: const FullType(String),
      );
    }
    if (object.tags != null) {
      yield r'tags';
      yield serializers.serialize(
        object.tags,
        specifiedType: const FullType(String),
      );
    }
    if (object.question != null) {
      yield r'question';
      yield serializers.serialize(
        object.question,
        specifiedType: const FullType(String),
      );
    }
    if (object.answer != null) {
      yield r'answer';
      yield serializers.serialize(
        object.answer,
        specifiedType: const FullType(String),
      );
    }
    if (object.totalCount != null) {
      yield r'total_count';
      yield serializers.serialize(
        object.totalCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.next != null) {
      yield r'next';
      yield serializers.serialize(
        object.next,
        specifiedType: const FullType(String),
      );
    }
    if (object.prev != null) {
      yield r'prev';
      yield serializers.serialize(
        object.prev,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    QuestionsListData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required QuestionsListDataBuilder result,
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
        case r'date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.date = valueDes;
          break;
        case r'responsible':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.responsible = valueDes;
          break;
        case r'tags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.tags = valueDes;
          break;
        case r'question':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.question = valueDes;
          break;
        case r'answer':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.answer = valueDes;
          break;
        case r'total_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.totalCount = valueDes;
          break;
        case r'next':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.next = valueDes;
          break;
        case r'prev':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.prev = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  QuestionsListData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = QuestionsListDataBuilder();
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

