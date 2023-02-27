// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'list_page_success_response_body_all_of.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ListPageSuccessResponseBodyAllOf>
    _$listPageSuccessResponseBodyAllOfSerializer =
    new _$ListPageSuccessResponseBodyAllOfSerializer();

class _$ListPageSuccessResponseBodyAllOfSerializer
    implements StructuredSerializer<ListPageSuccessResponseBodyAllOf> {
  @override
  final Iterable<Type> types = const [
    ListPageSuccessResponseBodyAllOf,
    _$ListPageSuccessResponseBodyAllOf
  ];
  @override
  final String wireName = 'ListPageSuccessResponseBodyAllOf';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ListPageSuccessResponseBodyAllOf object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(ListPageResponseData)));
    }
    return result;
  }

  @override
  ListPageSuccessResponseBodyAllOf deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ListPageSuccessResponseBodyAllOfBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ListPageResponseData))
              as ListPageResponseData);
          break;
      }
    }

    return result.build();
  }
}

class _$ListPageSuccessResponseBodyAllOf
    extends ListPageSuccessResponseBodyAllOf {
  @override
  final ListPageResponseData data;

  factory _$ListPageSuccessResponseBodyAllOf(
          [void Function(ListPageSuccessResponseBodyAllOfBuilder) updates]) =>
      (new ListPageSuccessResponseBodyAllOfBuilder()..update(updates))._build();

  _$ListPageSuccessResponseBodyAllOf._({this.data}) : super._();

  @override
  ListPageSuccessResponseBodyAllOf rebuild(
          void Function(ListPageSuccessResponseBodyAllOfBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListPageSuccessResponseBodyAllOfBuilder toBuilder() =>
      new ListPageSuccessResponseBodyAllOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListPageSuccessResponseBodyAllOf && data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ListPageSuccessResponseBodyAllOf')
          ..add('data', data))
        .toString();
  }
}

class ListPageSuccessResponseBodyAllOfBuilder
    implements
        Builder<ListPageSuccessResponseBodyAllOf,
            ListPageSuccessResponseBodyAllOfBuilder> {
  _$ListPageSuccessResponseBodyAllOf _$v;

  ListPageResponseDataBuilder _data;
  ListPageResponseDataBuilder get data =>
      _$this._data ??= new ListPageResponseDataBuilder();
  set data(ListPageResponseDataBuilder data) => _$this._data = data;

  ListPageSuccessResponseBodyAllOfBuilder() {
    ListPageSuccessResponseBodyAllOf._initializeBuilder(this);
  }

  ListPageSuccessResponseBodyAllOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ListPageSuccessResponseBodyAllOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ListPageSuccessResponseBodyAllOf;
  }

  @override
  void update(void Function(ListPageSuccessResponseBodyAllOfBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ListPageSuccessResponseBodyAllOf build() => _build();

  _$ListPageSuccessResponseBodyAllOf _build() {
    _$ListPageSuccessResponseBodyAllOf _$result;
    try {
      _$result =
          _$v ?? new _$ListPageSuccessResponseBodyAllOf._(data: _data?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ListPageSuccessResponseBodyAllOf', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
