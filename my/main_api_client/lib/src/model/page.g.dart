// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Page extends Page {
  @override
  final OneOf oneOf;

  factory _$Page([void Function(PageBuilder)? updates]) =>
      (new PageBuilder()..update(updates))._build();

  _$Page._({required this.oneOf}) : super._() {
    BuiltValueNullFieldError.checkNotNull(oneOf, r'Page', 'oneOf');
  }

  @override
  Page rebuild(void Function(PageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PageBuilder toBuilder() => new PageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Page && oneOf == other.oneOf;
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
    return (newBuiltValueToStringHelper(r'Page')..add('oneOf', oneOf))
        .toString();
  }
}

class PageBuilder implements Builder<Page, PageBuilder> {
  _$Page? _$v;

  OneOf? _oneOf;
  OneOf? get oneOf => _$this._oneOf;
  set oneOf(OneOf? oneOf) => _$this._oneOf = oneOf;

  PageBuilder() {
    Page._defaults(this);
  }

  PageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _oneOf = $v.oneOf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Page other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Page;
  }

  @override
  void update(void Function(PageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Page build() => _build();

  _$Page _build() {
    final _$result = _$v ??
        new _$Page._(
            oneOf:
                BuiltValueNullFieldError.checkNotNull(oneOf, r'Page', 'oneOf'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
