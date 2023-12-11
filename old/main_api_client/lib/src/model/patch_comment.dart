//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'patch_comment.g.dart';

/// PatchComment
///
/// Properties:
/// * [text] 
@BuiltValue()
abstract class PatchComment implements Built<PatchComment, PatchCommentBuilder> {
  @BuiltValueField(wireName: r'text')
  String get text;

  PatchComment._();

  factory PatchComment([void updates(PatchCommentBuilder b)]) = _$PatchComment;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PatchCommentBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PatchComment> get serializer => _$PatchCommentSerializer();
}

class _$PatchCommentSerializer implements PrimitiveSerializer<PatchComment> {
  @override
  final Iterable<Type> types = const [PatchComment, _$PatchComment];

  @override
  final String wireName = r'PatchComment';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PatchComment object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'text';
    yield serializers.serialize(
      object.text,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PatchComment object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PatchCommentBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'text':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.text = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PatchComment deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PatchCommentBuilder();
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

