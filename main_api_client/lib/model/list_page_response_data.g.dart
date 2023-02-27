// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'list_page_response_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ListPageResponseData> _$listPageResponseDataSerializer =
    new _$ListPageResponseDataSerializer();

class _$ListPageResponseDataSerializer
    implements StructuredSerializer<ListPageResponseData> {
  @override
  final Iterable<Type> types = const [
    ListPageResponseData,
    _$ListPageResponseData
  ];
  @override
  final String wireName = 'ListPageResponseData';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ListPageResponseData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.pages;
    if (value != null) {
      result
        ..add('pages')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Page)])));
    }
    return result;
  }

  @override
  ListPageResponseData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ListPageResponseDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'pages':
          result.pages.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Page)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$ListPageResponseData extends ListPageResponseData {
  @override
  final BuiltList<Page> pages;

  factory _$ListPageResponseData(
          [void Function(ListPageResponseDataBuilder) updates]) =>
      (new ListPageResponseDataBuilder()..update(updates))._build();

  _$ListPageResponseData._({this.pages}) : super._();

  @override
  ListPageResponseData rebuild(
          void Function(ListPageResponseDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListPageResponseDataBuilder toBuilder() =>
      new ListPageResponseDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListPageResponseData && pages == other.pages;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, pages.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ListPageResponseData')
          ..add('pages', pages))
        .toString();
  }
}

class ListPageResponseDataBuilder
    implements Builder<ListPageResponseData, ListPageResponseDataBuilder> {
  _$ListPageResponseData _$v;

  ListBuilder<Page> _pages;
  ListBuilder<Page> get pages => _$this._pages ??= new ListBuilder<Page>();
  set pages(ListBuilder<Page> pages) => _$this._pages = pages;

  ListPageResponseDataBuilder() {
    ListPageResponseData._initializeBuilder(this);
  }

  ListPageResponseDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pages = $v.pages?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ListPageResponseData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ListPageResponseData;
  }

  @override
  void update(void Function(ListPageResponseDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ListPageResponseData build() => _build();

  _$ListPageResponseData _build() {
    _$ListPageResponseData _$result;
    try {
      _$result = _$v ?? new _$ListPageResponseData._(pages: _pages?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'pages';
        _pages?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ListPageResponseData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
