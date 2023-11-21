// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directory_meta.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class DirectoryMetaBuilder {
  void replace(DirectoryMeta other);
  void update(void Function(DirectoryMetaBuilder) updates);
  DirectoryMetaSelectBuilder get select;
  set select(DirectoryMetaSelectBuilder? select);
}

class _$$DirectoryMeta extends $DirectoryMeta {
  @override
  final DirectoryMetaSelect? select;

  factory _$$DirectoryMeta([void Function($DirectoryMetaBuilder)? updates]) =>
      (new $DirectoryMetaBuilder()..update(updates))._build();

  _$$DirectoryMeta._({this.select}) : super._();

  @override
  $DirectoryMeta rebuild(void Function($DirectoryMetaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $DirectoryMetaBuilder toBuilder() =>
      new $DirectoryMetaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $DirectoryMeta && select == other.select;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, select.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'$DirectoryMeta')
          ..add('select', select))
        .toString();
  }
}

class $DirectoryMetaBuilder
    implements
        Builder<$DirectoryMeta, $DirectoryMetaBuilder>,
        DirectoryMetaBuilder {
  _$$DirectoryMeta? _$v;

  DirectoryMetaSelectBuilder? _select;
  DirectoryMetaSelectBuilder get select =>
      _$this._select ??= new DirectoryMetaSelectBuilder();
  set select(covariant DirectoryMetaSelectBuilder? select) =>
      _$this._select = select;

  $DirectoryMetaBuilder() {
    $DirectoryMeta._defaults(this);
  }

  $DirectoryMetaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _select = $v.select?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant $DirectoryMeta other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$$DirectoryMeta;
  }

  @override
  void update(void Function($DirectoryMetaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $DirectoryMeta build() => _build();

  _$$DirectoryMeta _build() {
    _$$DirectoryMeta _$result;
    try {
      _$result = _$v ?? new _$$DirectoryMeta._(select: _select?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'select';
        _select?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'$DirectoryMeta', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
