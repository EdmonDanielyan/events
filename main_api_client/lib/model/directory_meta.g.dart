// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'directory_meta.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DirectoryMeta> _$directoryMetaSerializer =
    new _$DirectoryMetaSerializer();

class _$DirectoryMetaSerializer implements StructuredSerializer<DirectoryMeta> {
  @override
  final Iterable<Type> types = const [DirectoryMeta, _$DirectoryMeta];
  @override
  final String wireName = 'DirectoryMeta';

  @override
  Iterable<Object> serialize(Serializers serializers, DirectoryMeta object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.select;
    if (value != null) {
      result
        ..add('select')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DirectoryMetaSelect)));
    }
    return result;
  }

  @override
  DirectoryMeta deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DirectoryMetaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'select':
          result.select.replace(serializers.deserialize(value,
                  specifiedType: const FullType(DirectoryMetaSelect))
              as DirectoryMetaSelect);
          break;
      }
    }

    return result.build();
  }
}

class _$DirectoryMeta extends DirectoryMeta {
  @override
  final DirectoryMetaSelect select;

  factory _$DirectoryMeta([void Function(DirectoryMetaBuilder) updates]) =>
      (new DirectoryMetaBuilder()..update(updates))._build();

  _$DirectoryMeta._({this.select}) : super._();

  @override
  DirectoryMeta rebuild(void Function(DirectoryMetaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DirectoryMetaBuilder toBuilder() => new DirectoryMetaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DirectoryMeta && select == other.select;
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
    return (newBuiltValueToStringHelper(r'DirectoryMeta')
          ..add('select', select))
        .toString();
  }
}

class DirectoryMetaBuilder
    implements Builder<DirectoryMeta, DirectoryMetaBuilder> {
  _$DirectoryMeta _$v;

  DirectoryMetaSelectBuilder _select;
  DirectoryMetaSelectBuilder get select =>
      _$this._select ??= new DirectoryMetaSelectBuilder();
  set select(DirectoryMetaSelectBuilder select) => _$this._select = select;

  DirectoryMetaBuilder() {
    DirectoryMeta._initializeBuilder(this);
  }

  DirectoryMetaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _select = $v.select?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DirectoryMeta other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DirectoryMeta;
  }

  @override
  void update(void Function(DirectoryMetaBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  DirectoryMeta build() => _build();

  _$DirectoryMeta _build() {
    _$DirectoryMeta _$result;
    try {
      _$result = _$v ?? new _$DirectoryMeta._(select: _select?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'select';
        _select?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'DirectoryMeta', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
