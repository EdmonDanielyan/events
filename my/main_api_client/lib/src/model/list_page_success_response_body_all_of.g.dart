// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_page_success_response_body_all_of.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class ListPageSuccessResponseBodyAllOfBuilder {
  void replace(ListPageSuccessResponseBodyAllOf other);
  void update(void Function(ListPageSuccessResponseBodyAllOfBuilder) updates);
  ListPageResponseDataBuilder get data;
  set data(ListPageResponseDataBuilder? data);
}

class _$$ListPageSuccessResponseBodyAllOf
    extends $ListPageSuccessResponseBodyAllOf {
  @override
  final ListPageResponseData? data;

  factory _$$ListPageSuccessResponseBodyAllOf(
          [void Function($ListPageSuccessResponseBodyAllOfBuilder)? updates]) =>
      (new $ListPageSuccessResponseBodyAllOfBuilder()..update(updates))
          ._build();

  _$$ListPageSuccessResponseBodyAllOf._({this.data}) : super._();

  @override
  $ListPageSuccessResponseBodyAllOf rebuild(
          void Function($ListPageSuccessResponseBodyAllOfBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $ListPageSuccessResponseBodyAllOfBuilder toBuilder() =>
      new $ListPageSuccessResponseBodyAllOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $ListPageSuccessResponseBodyAllOf && data == other.data;
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
    return (newBuiltValueToStringHelper(r'$ListPageSuccessResponseBodyAllOf')
          ..add('data', data))
        .toString();
  }
}

class $ListPageSuccessResponseBodyAllOfBuilder
    implements
        Builder<$ListPageSuccessResponseBodyAllOf,
            $ListPageSuccessResponseBodyAllOfBuilder>,
        ListPageSuccessResponseBodyAllOfBuilder {
  _$$ListPageSuccessResponseBodyAllOf? _$v;

  ListPageResponseDataBuilder? _data;
  ListPageResponseDataBuilder get data =>
      _$this._data ??= new ListPageResponseDataBuilder();
  set data(covariant ListPageResponseDataBuilder? data) => _$this._data = data;

  $ListPageSuccessResponseBodyAllOfBuilder() {
    $ListPageSuccessResponseBodyAllOf._defaults(this);
  }

  $ListPageSuccessResponseBodyAllOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant $ListPageSuccessResponseBodyAllOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$$ListPageSuccessResponseBodyAllOf;
  }

  @override
  void update(
      void Function($ListPageSuccessResponseBodyAllOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $ListPageSuccessResponseBodyAllOf build() => _build();

  _$$ListPageSuccessResponseBodyAllOf _build() {
    _$$ListPageSuccessResponseBodyAllOf _$result;
    try {
      _$result = _$v ??
          new _$$ListPageSuccessResponseBodyAllOf._(data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'$ListPageSuccessResponseBodyAllOf', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
