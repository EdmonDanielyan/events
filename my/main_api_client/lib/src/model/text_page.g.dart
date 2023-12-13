// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_page.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TextPage extends TextPage {
  @override
  final String type;
  @override
  final int id;
  @override
  final String? code;
  @override
  final String name;
  @override
  final String? preview;
  @override
  final String detail;
  @override
  final String? iconUrl;

  factory _$TextPage([void Function(TextPageBuilder)? updates]) =>
      (new TextPageBuilder()..update(updates))._build();

  _$TextPage._(
      {required this.type,
      required this.id,
      this.code,
      required this.name,
      this.preview,
      required this.detail,
      this.iconUrl})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(type, r'TextPage', 'type');
    BuiltValueNullFieldError.checkNotNull(id, r'TextPage', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'TextPage', 'name');
    BuiltValueNullFieldError.checkNotNull(detail, r'TextPage', 'detail');
  }

  @override
  TextPage rebuild(void Function(TextPageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextPageBuilder toBuilder() => new TextPageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextPage &&
        type == other.type &&
        id == other.id &&
        code == other.code &&
        name == other.name &&
        preview == other.preview &&
        detail == other.detail &&
        iconUrl == other.iconUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, preview.hashCode);
    _$hash = $jc(_$hash, detail.hashCode);
    _$hash = $jc(_$hash, iconUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TextPage')
          ..add('type', type)
          ..add('id', id)
          ..add('code', code)
          ..add('name', name)
          ..add('preview', preview)
          ..add('detail', detail)
          ..add('iconUrl', iconUrl))
        .toString();
  }
}

class TextPageBuilder implements Builder<TextPage, TextPageBuilder> {
  _$TextPage? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _preview;
  String? get preview => _$this._preview;
  set preview(String? preview) => _$this._preview = preview;

  String? _detail;
  String? get detail => _$this._detail;
  set detail(String? detail) => _$this._detail = detail;

  String? _iconUrl;
  String? get iconUrl => _$this._iconUrl;
  set iconUrl(String? iconUrl) => _$this._iconUrl = iconUrl;

  TextPageBuilder() {
    TextPage._defaults(this);
  }

  TextPageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _id = $v.id;
      _code = $v.code;
      _name = $v.name;
      _preview = $v.preview;
      _detail = $v.detail;
      _iconUrl = $v.iconUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TextPage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextPage;
  }

  @override
  void update(void Function(TextPageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextPage build() => _build();

  _$TextPage _build() {
    final _$result = _$v ??
        new _$TextPage._(
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'TextPage', 'type'),
            id: BuiltValueNullFieldError.checkNotNull(id, r'TextPage', 'id'),
            code: code,
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'TextPage', 'name'),
            preview: preview,
            detail: BuiltValueNullFieldError.checkNotNull(
                detail, r'TextPage', 'detail'),
            iconUrl: iconUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
