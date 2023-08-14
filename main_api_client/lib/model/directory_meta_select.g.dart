// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'directory_meta_select.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DirectoryMetaSelect> _$directoryMetaSelectSerializer =
    new _$DirectoryMetaSelectSerializer();

class _$DirectoryMetaSelectSerializer
    implements StructuredSerializer<DirectoryMetaSelect> {
  @override
  final Iterable<Type> types = const [
    DirectoryMetaSelect,
    _$DirectoryMetaSelect
  ];
  @override
  final String wireName = 'DirectoryMetaSelect';

  @override
  Iterable<Object> serialize(
      Serializers serializers, DirectoryMetaSelect object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.valueField;
    if (value != null) {
      result
        ..add('valueField')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.labelField;
    if (value != null) {
      result
        ..add('labelField')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.parentDirectory;
    if (value != null) {
      result
        ..add('parentDirectory')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.parentKey;
    if (value != null) {
      result
        ..add('parentKey')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  DirectoryMetaSelect deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DirectoryMetaSelectBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'valueField':
          result.valueField = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'labelField':
          result.labelField = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'parentDirectory':
          result.parentDirectory = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'parentKey':
          result.parentKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$DirectoryMetaSelect extends DirectoryMetaSelect {
  @override
  final num valueField;
  @override
  final String labelField;
  @override
  final String parentDirectory;
  @override
  final String parentKey;

  factory _$DirectoryMetaSelect(
          [void Function(DirectoryMetaSelectBuilder) updates]) =>
      (new DirectoryMetaSelectBuilder()..update(updates))._build();

  _$DirectoryMetaSelect._(
      {this.valueField, this.labelField, this.parentDirectory, this.parentKey})
      : super._();

  @override
  DirectoryMetaSelect rebuild(
          void Function(DirectoryMetaSelectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DirectoryMetaSelectBuilder toBuilder() =>
      new DirectoryMetaSelectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DirectoryMetaSelect &&
        valueField == other.valueField &&
        labelField == other.labelField &&
        parentDirectory == other.parentDirectory &&
        parentKey == other.parentKey;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, valueField.hashCode);
    _$hash = $jc(_$hash, labelField.hashCode);
    _$hash = $jc(_$hash, parentDirectory.hashCode);
    _$hash = $jc(_$hash, parentKey.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DirectoryMetaSelect')
          ..add('valueField', valueField)
          ..add('labelField', labelField)
          ..add('parentDirectory', parentDirectory)
          ..add('parentKey', parentKey))
        .toString();
  }
}

class DirectoryMetaSelectBuilder
    implements Builder<DirectoryMetaSelect, DirectoryMetaSelectBuilder> {
  _$DirectoryMetaSelect _$v;

  num _valueField;
  num get valueField => _$this._valueField;
  set valueField(num valueField) => _$this._valueField = valueField;

  String _labelField;
  String get labelField => _$this._labelField;
  set labelField(String labelField) => _$this._labelField = labelField;

  String _parentDirectory;
  String get parentDirectory => _$this._parentDirectory;
  set parentDirectory(String parentDirectory) =>
      _$this._parentDirectory = parentDirectory;

  String _parentKey;
  String get parentKey => _$this._parentKey;
  set parentKey(String parentKey) => _$this._parentKey = parentKey;

  DirectoryMetaSelectBuilder() {
    DirectoryMetaSelect._initializeBuilder(this);
  }

  DirectoryMetaSelectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _valueField = $v.valueField;
      _labelField = $v.labelField;
      _parentDirectory = $v.parentDirectory;
      _parentKey = $v.parentKey;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DirectoryMetaSelect other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DirectoryMetaSelect;
  }

  @override
  void update(void Function(DirectoryMetaSelectBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  DirectoryMetaSelect build() => _build();

  _$DirectoryMetaSelect _build() {
    final _$result = _$v ??
        new _$DirectoryMetaSelect._(
            valueField: valueField,
            labelField: labelField,
            parentDirectory: parentDirectory,
            parentKey: parentKey);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
