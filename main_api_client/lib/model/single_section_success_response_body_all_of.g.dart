// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'single_section_success_response_body_all_of.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SingleSectionSuccessResponseBodyAllOf>
    _$singleSectionSuccessResponseBodyAllOfSerializer =
    new _$SingleSectionSuccessResponseBodyAllOfSerializer();

class _$SingleSectionSuccessResponseBodyAllOfSerializer
    implements StructuredSerializer<SingleSectionSuccessResponseBodyAllOf> {
  @override
  final Iterable<Type> types = const [
    SingleSectionSuccessResponseBodyAllOf,
    _$SingleSectionSuccessResponseBodyAllOf
  ];
  @override
  final String wireName = 'SingleSectionSuccessResponseBodyAllOf';

  @override
  Iterable<Object> serialize(
      Serializers serializers, SingleSectionSuccessResponseBodyAllOf object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(SingleSectionResponseData)));
    }
    return result;
  }

  @override
  SingleSectionSuccessResponseBodyAllOf deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SingleSectionSuccessResponseBodyAllOfBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SingleSectionResponseData))
              as SingleSectionResponseData);
          break;
      }
    }

    return result.build();
  }
}

class _$SingleSectionSuccessResponseBodyAllOf
    extends SingleSectionSuccessResponseBodyAllOf {
  @override
  final SingleSectionResponseData data;

  factory _$SingleSectionSuccessResponseBodyAllOf(
          [void Function(SingleSectionSuccessResponseBodyAllOfBuilder)
              updates]) =>
      (new SingleSectionSuccessResponseBodyAllOfBuilder()..update(updates))
          ._build();

  _$SingleSectionSuccessResponseBodyAllOf._({this.data}) : super._();

  @override
  SingleSectionSuccessResponseBodyAllOf rebuild(
          void Function(SingleSectionSuccessResponseBodyAllOfBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SingleSectionSuccessResponseBodyAllOfBuilder toBuilder() =>
      new SingleSectionSuccessResponseBodyAllOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SingleSectionSuccessResponseBodyAllOf && data == other.data;
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
    return (newBuiltValueToStringHelper(
            r'SingleSectionSuccessResponseBodyAllOf')
          ..add('data', data))
        .toString();
  }
}

class SingleSectionSuccessResponseBodyAllOfBuilder
    implements
        Builder<SingleSectionSuccessResponseBodyAllOf,
            SingleSectionSuccessResponseBodyAllOfBuilder> {
  _$SingleSectionSuccessResponseBodyAllOf _$v;

  SingleSectionResponseDataBuilder _data;
  SingleSectionResponseDataBuilder get data =>
      _$this._data ??= new SingleSectionResponseDataBuilder();
  set data(SingleSectionResponseDataBuilder data) => _$this._data = data;

  SingleSectionSuccessResponseBodyAllOfBuilder() {
    SingleSectionSuccessResponseBodyAllOf._initializeBuilder(this);
  }

  SingleSectionSuccessResponseBodyAllOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SingleSectionSuccessResponseBodyAllOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SingleSectionSuccessResponseBodyAllOf;
  }

  @override
  void update(
      void Function(SingleSectionSuccessResponseBodyAllOfBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  SingleSectionSuccessResponseBodyAllOf build() => _build();

  _$SingleSectionSuccessResponseBodyAllOf _build() {
    _$SingleSectionSuccessResponseBodyAllOf _$result;
    try {
      _$result = _$v ??
          new _$SingleSectionSuccessResponseBodyAllOf._(data: _data?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SingleSectionSuccessResponseBodyAllOf',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
