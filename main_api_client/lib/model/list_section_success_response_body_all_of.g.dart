// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'list_section_success_response_body_all_of.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ListSectionSuccessResponseBodyAllOf>
    _$listSectionSuccessResponseBodyAllOfSerializer =
    new _$ListSectionSuccessResponseBodyAllOfSerializer();

class _$ListSectionSuccessResponseBodyAllOfSerializer
    implements StructuredSerializer<ListSectionSuccessResponseBodyAllOf> {
  @override
  final Iterable<Type> types = const [
    ListSectionSuccessResponseBodyAllOf,
    _$ListSectionSuccessResponseBodyAllOf
  ];
  @override
  final String wireName = 'ListSectionSuccessResponseBodyAllOf';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ListSectionSuccessResponseBodyAllOf object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(ListSectionResponseData)));
    }
    return result;
  }

  @override
  ListSectionSuccessResponseBodyAllOf deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ListSectionSuccessResponseBodyAllOfBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ListSectionResponseData))
              as ListSectionResponseData);
          break;
      }
    }

    return result.build();
  }
}

class _$ListSectionSuccessResponseBodyAllOf
    extends ListSectionSuccessResponseBodyAllOf {
  @override
  final ListSectionResponseData data;

  factory _$ListSectionSuccessResponseBodyAllOf(
          [void Function(ListSectionSuccessResponseBodyAllOfBuilder)
              updates]) =>
      (new ListSectionSuccessResponseBodyAllOfBuilder()..update(updates))
          ._build();

  _$ListSectionSuccessResponseBodyAllOf._({this.data}) : super._();

  @override
  ListSectionSuccessResponseBodyAllOf rebuild(
          void Function(ListSectionSuccessResponseBodyAllOfBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListSectionSuccessResponseBodyAllOfBuilder toBuilder() =>
      new ListSectionSuccessResponseBodyAllOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListSectionSuccessResponseBodyAllOf && data == other.data;
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
    return (newBuiltValueToStringHelper(r'ListSectionSuccessResponseBodyAllOf')
          ..add('data', data))
        .toString();
  }
}

class ListSectionSuccessResponseBodyAllOfBuilder
    implements
        Builder<ListSectionSuccessResponseBodyAllOf,
            ListSectionSuccessResponseBodyAllOfBuilder> {
  _$ListSectionSuccessResponseBodyAllOf _$v;

  ListSectionResponseDataBuilder _data;
  ListSectionResponseDataBuilder get data =>
      _$this._data ??= new ListSectionResponseDataBuilder();
  set data(ListSectionResponseDataBuilder data) => _$this._data = data;

  ListSectionSuccessResponseBodyAllOfBuilder() {
    ListSectionSuccessResponseBodyAllOf._initializeBuilder(this);
  }

  ListSectionSuccessResponseBodyAllOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ListSectionSuccessResponseBodyAllOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ListSectionSuccessResponseBodyAllOf;
  }

  @override
  void update(
      void Function(ListSectionSuccessResponseBodyAllOfBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ListSectionSuccessResponseBodyAllOf build() => _build();

  _$ListSectionSuccessResponseBodyAllOf _build() {
    _$ListSectionSuccessResponseBodyAllOf _$result;
    try {
      _$result = _$v ??
          new _$ListSectionSuccessResponseBodyAllOf._(data: _data?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ListSectionSuccessResponseBodyAllOf',
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
