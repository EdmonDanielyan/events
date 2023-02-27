// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'single_page_response_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SinglePageResponseData> _$singlePageResponseDataSerializer =
    new _$SinglePageResponseDataSerializer();

class _$SinglePageResponseDataSerializer
    implements StructuredSerializer<SinglePageResponseData> {
  @override
  final Iterable<Type> types = const [
    SinglePageResponseData,
    _$SinglePageResponseData
  ];
  @override
  final String wireName = 'SinglePageResponseData';

  @override
  Iterable<Object> serialize(
      Serializers serializers, SinglePageResponseData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.page;
    if (value != null) {
      result
        ..add('page')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Page)));
    }
    return result;
  }

  @override
  SinglePageResponseData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SinglePageResponseDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'page':
          result.page.replace(serializers.deserialize(value,
              specifiedType: const FullType(Page)) as Page);
          break;
      }
    }

    return result.build();
  }
}

class _$SinglePageResponseData extends SinglePageResponseData {
  @override
  final Page page;

  factory _$SinglePageResponseData(
          [void Function(SinglePageResponseDataBuilder) updates]) =>
      (new SinglePageResponseDataBuilder()..update(updates))._build();

  _$SinglePageResponseData._({this.page}) : super._();

  @override
  SinglePageResponseData rebuild(
          void Function(SinglePageResponseDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SinglePageResponseDataBuilder toBuilder() =>
      new SinglePageResponseDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SinglePageResponseData && page == other.page;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SinglePageResponseData')
          ..add('page', page))
        .toString();
  }
}

class SinglePageResponseDataBuilder
    implements Builder<SinglePageResponseData, SinglePageResponseDataBuilder> {
  _$SinglePageResponseData _$v;

  PageBuilder _page;
  PageBuilder get page => _$this._page ??= new PageBuilder();
  set page(PageBuilder page) => _$this._page = page;

  SinglePageResponseDataBuilder() {
    SinglePageResponseData._initializeBuilder(this);
  }

  SinglePageResponseDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _page = $v.page?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SinglePageResponseData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SinglePageResponseData;
  }

  @override
  void update(void Function(SinglePageResponseDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  SinglePageResponseData build() => _build();

  _$SinglePageResponseData _build() {
    _$SinglePageResponseData _$result;
    try {
      _$result = _$v ?? new _$SinglePageResponseData._(page: _page?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'page';
        _page?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SinglePageResponseData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
