// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'news_tab.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NewsTab> _$newsTabSerializer = new _$NewsTabSerializer();

class _$NewsTabSerializer implements StructuredSerializer<NewsTab> {
  @override
  final Iterable<Type> types = const [NewsTab, _$NewsTab];
  @override
  final String wireName = 'NewsTab';

  @override
  Iterable<Object> serialize(Serializers serializers, NewsTab object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.visible;
    if (value != null) {
      result
        ..add('visible')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.new_;
    if (value != null) {
      result
        ..add('new')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  NewsTab deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NewsTabBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'visible':
          result.visible = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'new':
          result.new_ = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$NewsTab extends NewsTab {
  @override
  final String code;
  @override
  final String title;
  @override
  final bool visible;
  @override
  final int new_;

  factory _$NewsTab([void Function(NewsTabBuilder) updates]) =>
      (new NewsTabBuilder()..update(updates))._build();

  _$NewsTab._({this.code, this.title, this.visible, this.new_}) : super._();

  @override
  NewsTab rebuild(void Function(NewsTabBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewsTabBuilder toBuilder() => new NewsTabBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsTab &&
        code == other.code &&
        title == other.title &&
        visible == other.visible &&
        new_ == other.new_;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, visible.hashCode);
    _$hash = $jc(_$hash, new_.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NewsTab')
          ..add('code', code)
          ..add('title', title)
          ..add('visible', visible)
          ..add('new_', new_))
        .toString();
  }
}

class NewsTabBuilder implements Builder<NewsTab, NewsTabBuilder> {
  _$NewsTab _$v;

  String _code;
  String get code => _$this._code;
  set code(String code) => _$this._code = code;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  bool _visible;
  bool get visible => _$this._visible;
  set visible(bool visible) => _$this._visible = visible;

  int _new_;
  int get new_ => _$this._new_;
  set new_(int new_) => _$this._new_ = new_;

  NewsTabBuilder() {
    NewsTab._initializeBuilder(this);
  }

  NewsTabBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _title = $v.title;
      _visible = $v.visible;
      _new_ = $v.new_;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewsTab other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NewsTab;
  }

  @override
  void update(void Function(NewsTabBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  NewsTab build() => _build();

  _$NewsTab _build() {
    final _$result = _$v ??
        new _$NewsTab._(code: code, title: title, visible: visible, new_: new_);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
