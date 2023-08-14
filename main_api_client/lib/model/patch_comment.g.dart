// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'patch_comment.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PatchComment> _$patchCommentSerializer =
    new _$PatchCommentSerializer();

class _$PatchCommentSerializer implements StructuredSerializer<PatchComment> {
  @override
  final Iterable<Type> types = const [PatchComment, _$PatchComment];
  @override
  final String wireName = 'PatchComment';

  @override
  Iterable<Object> serialize(Serializers serializers, PatchComment object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.text;
    if (value != null) {
      result
        ..add('text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PatchComment deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PatchCommentBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PatchComment extends PatchComment {
  @override
  final String text;

  factory _$PatchComment([void Function(PatchCommentBuilder) updates]) =>
      (new PatchCommentBuilder()..update(updates))._build();

  _$PatchComment._({this.text}) : super._();

  @override
  PatchComment rebuild(void Function(PatchCommentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PatchCommentBuilder toBuilder() => new PatchCommentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PatchComment && text == other.text;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PatchComment')..add('text', text))
        .toString();
  }
}

class PatchCommentBuilder
    implements Builder<PatchComment, PatchCommentBuilder> {
  _$PatchComment _$v;

  String _text;
  String get text => _$this._text;
  set text(String text) => _$this._text = text;

  PatchCommentBuilder() {
    PatchComment._initializeBuilder(this);
  }

  PatchCommentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PatchComment other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PatchComment;
  }

  @override
  void update(void Function(PatchCommentBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  PatchComment build() => _build();

  _$PatchComment _build() {
    final _$result = _$v ?? new _$PatchComment._(text: text);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
