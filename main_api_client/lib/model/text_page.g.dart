// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'text_page.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TextPage> _$textPageSerializer = new _$TextPageSerializer();

class _$TextPageSerializer implements StructuredSerializer<TextPage> {
  @override
  final Iterable<Type> types = const [TextPage, _$TextPage];
  @override
  final String wireName = 'TextPage';

  @override
  Iterable<Object> serialize(Serializers serializers, TextPage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.preview;
    if (value != null) {
      result
        ..add('preview')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.detail;
    if (value != null) {
      result
        ..add('detail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  TextPage deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TextPageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'preview':
          result.preview = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'detail':
          result.detail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$TextPage extends TextPage {
  @override
  final String type;
  @override
  final int id;
  @override
  final String code;
  @override
  final String name;
  @override
  final String preview;
  @override
  final String detail;

  factory _$TextPage([void Function(TextPageBuilder) updates]) =>
      (new TextPageBuilder()..update(updates))._build();

  _$TextPage._(
      {this.type, this.id, this.code, this.name, this.preview, this.detail})
      : super._();

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
        detail == other.detail;
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
          ..add('detail', detail))
        .toString();
  }
}

class TextPageBuilder implements Builder<TextPage, TextPageBuilder> {
  _$TextPage _$v;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _code;
  String get code => _$this._code;
  set code(String code) => _$this._code = code;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _preview;
  String get preview => _$this._preview;
  set preview(String preview) => _$this._preview = preview;

  String _detail;
  String get detail => _$this._detail;
  set detail(String detail) => _$this._detail = detail;

  TextPageBuilder() {
    TextPage._initializeBuilder(this);
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
  void update(void Function(TextPageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  TextPage build() => _build();

  _$TextPage _build() {
    final _$result = _$v ??
        new _$TextPage._(
            type: type,
            id: id,
            code: code,
            name: name,
            preview: preview,
            detail: detail);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
