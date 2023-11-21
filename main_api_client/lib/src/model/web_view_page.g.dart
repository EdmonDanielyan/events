// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_view_page.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WebViewPage extends WebViewPage {
  @override
  final String type;
  @override
  final int id;
  @override
  final String? code;
  @override
  final String name;
  @override
  final String url;
  @override
  final String? iconUrl;

  factory _$WebViewPage([void Function(WebViewPageBuilder)? updates]) =>
      (new WebViewPageBuilder()..update(updates))._build();

  _$WebViewPage._(
      {required this.type,
      required this.id,
      this.code,
      required this.name,
      required this.url,
      this.iconUrl})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(type, r'WebViewPage', 'type');
    BuiltValueNullFieldError.checkNotNull(id, r'WebViewPage', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'WebViewPage', 'name');
    BuiltValueNullFieldError.checkNotNull(url, r'WebViewPage', 'url');
  }

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
        url == other.url &&
        iconUrl == other.iconUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, iconUrl.hashCode);
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
          ..add('url', url)
          ..add('iconUrl', iconUrl))
        .toString();
  }
}

class WebViewPageBuilder implements Builder<WebViewPage, WebViewPageBuilder> {
  _$WebViewPage? _$v;

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

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _iconUrl;
  String? get iconUrl => _$this._iconUrl;
  set iconUrl(String? iconUrl) => _$this._iconUrl = iconUrl;

  WebViewPageBuilder() {
    WebViewPage._defaults(this);
  }

  WebViewPageBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _id = $v.id;
      _code = $v.code;
      _name = $v.name;
      _url = $v.url;
      _iconUrl = $v.iconUrl;
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
  void update(void Function(WebViewPageBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WebViewPage build() => _build();

  _$WebViewPage _build() {
    final _$result = _$v ??
        new _$WebViewPage._(
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'WebViewPage', 'type'),
            id: BuiltValueNullFieldError.checkNotNull(id, r'WebViewPage', 'id'),
            code: code,
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'WebViewPage', 'name'),
            url: BuiltValueNullFieldError.checkNotNull(
                url, r'WebViewPage', 'url'),
            iconUrl: iconUrl);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
