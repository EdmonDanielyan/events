// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'list_snippet_success_response_body_all_of.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ListSnippetSuccessResponseBodyAllOf>
    _$listSnippetSuccessResponseBodyAllOfSerializer =
    new _$ListSnippetSuccessResponseBodyAllOfSerializer();

class _$ListSnippetSuccessResponseBodyAllOfSerializer
    implements StructuredSerializer<ListSnippetSuccessResponseBodyAllOf> {
  @override
  final Iterable<Type> types = const [
    ListSnippetSuccessResponseBodyAllOf,
    _$ListSnippetSuccessResponseBodyAllOf
  ];
  @override
  final String wireName = 'ListSnippetSuccessResponseBodyAllOf';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ListSnippetSuccessResponseBodyAllOf object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(SnippetListResponseData)));
    }
    return result;
  }

  @override
  ListSnippetSuccessResponseBodyAllOf deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ListSnippetSuccessResponseBodyAllOfBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SnippetListResponseData))
              as SnippetListResponseData);
          break;
      }
    }

    return result.build();
  }
}

class _$ListSnippetSuccessResponseBodyAllOf
    extends ListSnippetSuccessResponseBodyAllOf {
  @override
  final SnippetListResponseData data;

  factory _$ListSnippetSuccessResponseBodyAllOf(
          [void Function(ListSnippetSuccessResponseBodyAllOfBuilder)
              updates]) =>
      (new ListSnippetSuccessResponseBodyAllOfBuilder()..update(updates))
          ._build();

  _$ListSnippetSuccessResponseBodyAllOf._({this.data}) : super._();

  @override
  ListSnippetSuccessResponseBodyAllOf rebuild(
          void Function(ListSnippetSuccessResponseBodyAllOfBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListSnippetSuccessResponseBodyAllOfBuilder toBuilder() =>
      new ListSnippetSuccessResponseBodyAllOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListSnippetSuccessResponseBodyAllOf && data == other.data;
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
    return (newBuiltValueToStringHelper(r'ListSnippetSuccessResponseBodyAllOf')
          ..add('data', data))
        .toString();
  }
}

class ListSnippetSuccessResponseBodyAllOfBuilder
    implements
        Builder<ListSnippetSuccessResponseBodyAllOf,
            ListSnippetSuccessResponseBodyAllOfBuilder> {
  _$ListSnippetSuccessResponseBodyAllOf _$v;

  SnippetListResponseDataBuilder _data;
  SnippetListResponseDataBuilder get data =>
      _$this._data ??= new SnippetListResponseDataBuilder();
  set data(SnippetListResponseDataBuilder data) => _$this._data = data;

  ListSnippetSuccessResponseBodyAllOfBuilder() {
    ListSnippetSuccessResponseBodyAllOf._initializeBuilder(this);
  }

  ListSnippetSuccessResponseBodyAllOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ListSnippetSuccessResponseBodyAllOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ListSnippetSuccessResponseBodyAllOf;
  }

  @override
  void update(
      void Function(ListSnippetSuccessResponseBodyAllOfBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ListSnippetSuccessResponseBodyAllOf build() => _build();

  _$ListSnippetSuccessResponseBodyAllOf _build() {
    _$ListSnippetSuccessResponseBodyAllOf _$result;
    try {
      _$result = _$v ??
          new _$ListSnippetSuccessResponseBodyAllOf._(data: _data?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ListSnippetSuccessResponseBodyAllOf',
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
