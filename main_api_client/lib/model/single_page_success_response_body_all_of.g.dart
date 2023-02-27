// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'single_page_success_response_body_all_of.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SinglePageSuccessResponseBodyAllOf>
    _$singlePageSuccessResponseBodyAllOfSerializer =
    new _$SinglePageSuccessResponseBodyAllOfSerializer();

class _$SinglePageSuccessResponseBodyAllOfSerializer
    implements StructuredSerializer<SinglePageSuccessResponseBodyAllOf> {
  @override
  final Iterable<Type> types = const [
    SinglePageSuccessResponseBodyAllOf,
    _$SinglePageSuccessResponseBodyAllOf
  ];
  @override
  final String wireName = 'SinglePageSuccessResponseBodyAllOf';

  @override
  Iterable<Object> serialize(
      Serializers serializers, SinglePageSuccessResponseBodyAllOf object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(SinglePageResponseData)));
    }
    return result;
  }

  @override
  SinglePageSuccessResponseBodyAllOf deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SinglePageSuccessResponseBodyAllOfBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SinglePageResponseData))
              as SinglePageResponseData);
          break;
      }
    }

    return result.build();
  }
}

class _$SinglePageSuccessResponseBodyAllOf
    extends SinglePageSuccessResponseBodyAllOf {
  @override
  final SinglePageResponseData data;

  factory _$SinglePageSuccessResponseBodyAllOf(
          [void Function(SinglePageSuccessResponseBodyAllOfBuilder) updates]) =>
      (new SinglePageSuccessResponseBodyAllOfBuilder()..update(updates))
          ._build();

  _$SinglePageSuccessResponseBodyAllOf._({this.data}) : super._();

  @override
  SinglePageSuccessResponseBodyAllOf rebuild(
          void Function(SinglePageSuccessResponseBodyAllOfBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SinglePageSuccessResponseBodyAllOfBuilder toBuilder() =>
      new SinglePageSuccessResponseBodyAllOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SinglePageSuccessResponseBodyAllOf && data == other.data;
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
    return (newBuiltValueToStringHelper(r'SinglePageSuccessResponseBodyAllOf')
          ..add('data', data))
        .toString();
  }
}

class SinglePageSuccessResponseBodyAllOfBuilder
    implements
        Builder<SinglePageSuccessResponseBodyAllOf,
            SinglePageSuccessResponseBodyAllOfBuilder> {
  _$SinglePageSuccessResponseBodyAllOf _$v;

  SinglePageResponseDataBuilder _data;
  SinglePageResponseDataBuilder get data =>
      _$this._data ??= new SinglePageResponseDataBuilder();
  set data(SinglePageResponseDataBuilder data) => _$this._data = data;

  SinglePageSuccessResponseBodyAllOfBuilder() {
    SinglePageSuccessResponseBodyAllOf._initializeBuilder(this);
  }

  SinglePageSuccessResponseBodyAllOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SinglePageSuccessResponseBodyAllOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SinglePageSuccessResponseBodyAllOf;
  }

  @override
  void update(
      void Function(SinglePageSuccessResponseBodyAllOfBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  SinglePageSuccessResponseBodyAllOf build() => _build();

  _$SinglePageSuccessResponseBodyAllOf _build() {
    _$SinglePageSuccessResponseBodyAllOf _$result;
    try {
      _$result = _$v ??
          new _$SinglePageSuccessResponseBodyAllOf._(data: _data?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SinglePageSuccessResponseBodyAllOf', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
