// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uni_sub_request_visitor.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UniSubRequestVisitor extends UniSubRequestVisitor {
  @override
  final OneOf oneOf;

  factory _$UniSubRequestVisitor(
          [void Function(UniSubRequestVisitorBuilder)? updates]) =>
      (new UniSubRequestVisitorBuilder()..update(updates))._build();

  _$UniSubRequestVisitor._({required this.oneOf}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        oneOf, r'UniSubRequestVisitor', 'oneOf');
  }

  @override
  UniSubRequestVisitor rebuild(
          void Function(UniSubRequestVisitorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UniSubRequestVisitorBuilder toBuilder() =>
      new UniSubRequestVisitorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UniSubRequestVisitor && oneOf == other.oneOf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, oneOf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UniSubRequestVisitor')
          ..add('oneOf', oneOf))
        .toString();
  }
}

class UniSubRequestVisitorBuilder
    implements Builder<UniSubRequestVisitor, UniSubRequestVisitorBuilder> {
  _$UniSubRequestVisitor? _$v;

  OneOf? _oneOf;
  OneOf? get oneOf => _$this._oneOf;
  set oneOf(OneOf? oneOf) => _$this._oneOf = oneOf;

  UniSubRequestVisitorBuilder() {
    UniSubRequestVisitor._defaults(this);
  }

  UniSubRequestVisitorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _oneOf = $v.oneOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UniSubRequestVisitor other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UniSubRequestVisitor;
  }

  @override
  void update(void Function(UniSubRequestVisitorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UniSubRequestVisitor build() => _build();

  _$UniSubRequestVisitor _build() {
    final _$result = _$v ??
        new _$UniSubRequestVisitor._(
            oneOf: BuiltValueNullFieldError.checkNotNull(
                oneOf, r'UniSubRequestVisitor', 'oneOf'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
