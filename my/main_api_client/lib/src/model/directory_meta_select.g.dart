// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directory_meta_select.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DirectoryMetaSelect extends DirectoryMetaSelect {
  @override
  final num? valueField;
  @override
  final String? labelField;
  @override
  final String? parentDirectory;
  @override
  final String? parentKey;

  factory _$DirectoryMetaSelect(
          [void Function(DirectoryMetaSelectBuilder)? updates]) =>
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
  _$DirectoryMetaSelect? _$v;

  num? _valueField;
  num? get valueField => _$this._valueField;
  set valueField(num? valueField) => _$this._valueField = valueField;

  String? _labelField;
  String? get labelField => _$this._labelField;
  set labelField(String? labelField) => _$this._labelField = labelField;

  String? _parentDirectory;
  String? get parentDirectory => _$this._parentDirectory;
  set parentDirectory(String? parentDirectory) =>
      _$this._parentDirectory = parentDirectory;

  String? _parentKey;
  String? get parentKey => _$this._parentKey;
  set parentKey(String? parentKey) => _$this._parentKey = parentKey;

  DirectoryMetaSelectBuilder() {
    DirectoryMetaSelect._defaults(this);
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
  void update(void Function(DirectoryMetaSelectBuilder)? updates) {
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
