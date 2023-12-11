// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patch_comment.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PatchComment extends PatchComment {
  @override
  final String text;

  factory _$PatchComment([void Function(PatchCommentBuilder)? updates]) =>
      (new PatchCommentBuilder()..update(updates))._build();

  _$PatchComment._({required this.text}) : super._() {
    BuiltValueNullFieldError.checkNotNull(text, r'PatchComment', 'text');
  }

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
  _$PatchComment? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  PatchCommentBuilder() {
    PatchComment._defaults(this);
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
  void update(void Function(PatchCommentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PatchComment build() => _build();

  _$PatchComment _build() {
    final _$result = _$v ??
        new _$PatchComment._(
            text: BuiltValueNullFieldError.checkNotNull(
                text, r'PatchComment', 'text'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
