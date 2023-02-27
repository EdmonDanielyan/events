// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'web_view_page.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WebViewPage> _$webViewPageSerializer = new _$WebViewPageSerializer();

class _$WebViewPageSerializer implements StructuredSerializer<WebViewPage> {
  @override
  final Iterable<Type> types = const [WebViewPage, _$WebViewPage];
  @override
  final String wireName = 'WebViewPage';

  @override
  Iterable<Object> serialize(Serializers serializers, WebViewPage object,
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
    value = object.url;
    if (value != null) {
      result
        ..add('url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  WebViewPage deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WebViewPageBuilder();

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
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$WebViewPage extends WebViewPage {
  @override
  final String type;
  @override
  final int id;
  @override
  final String code;
  @override
  final String name;
  @override
  final String url;

  factory _$WebViewPage([void Function(WebViewPageBuilder) updates]) =>
      (new WebViewPageBuilder()..update(updates))._build();

  _$WebViewPage._({this.type, this.id, this.code, this.name, this.url})
      : super._();

  @override
  WebViewPage rebuild(void Function(WebViewPageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebViewPageBuilder toBuilder() => new WebViewPageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebViewPage &&
        type == other.type &&
        id == other.id &&
        code == other.code &&
        name == other.name &&
        url == other.url;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WebViewPage')
          ..add('type', type)
          ..add('id', id)
          ..add('code', code)
          ..add('name', name)
          ..add('url', url))
        .toString();
  }
}

class WebViewPageBuilder implements Builder<WebViewPage, WebViewPageBuilder> {
  _$WebViewPage _$v;

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

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  WebViewPageBuilder() {
    WebViewPage._initializeBuilder(this);
  }

  WebViewPageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _id = $v.id;
      _code = $v.code;
      _name = $v.name;
      _url = $v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WebViewPage other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WebViewPage;
  }

  @override
  void update(void Function(WebViewPageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  WebViewPage build() => _build();

  _$WebViewPage _build() {
    final _$result = _$v ??
        new _$WebViewPage._(
            type: type, id: id, code: code, name: name, url: url);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
