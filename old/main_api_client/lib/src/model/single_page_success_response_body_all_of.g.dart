// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_page_success_response_body_all_of.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class SinglePageSuccessResponseBodyAllOfBuilder {
  void replace(SinglePageSuccessResponseBodyAllOf other);
  void update(void Function(SinglePageSuccessResponseBodyAllOfBuilder) updates);
  SinglePageResponseDataBuilder get data;
  set data(SinglePageResponseDataBuilder? data);
}

class _$$SinglePageSuccessResponseBodyAllOf
    extends $SinglePageSuccessResponseBodyAllOf {
  @override
  final SinglePageResponseData? data;

  factory _$$SinglePageSuccessResponseBodyAllOf(
          [void Function($SinglePageSuccessResponseBodyAllOfBuilder)?
              updates]) =>
      (new $SinglePageSuccessResponseBodyAllOfBuilder()..update(updates))
          ._build();

  _$$SinglePageSuccessResponseBodyAllOf._({this.data}) : super._();

  @override
  $SinglePageSuccessResponseBodyAllOf rebuild(
          void Function($SinglePageSuccessResponseBodyAllOfBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $SinglePageSuccessResponseBodyAllOfBuilder toBuilder() =>
      new $SinglePageSuccessResponseBodyAllOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $SinglePageSuccessResponseBodyAllOf && data == other.data;
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
    return (newBuiltValueToStringHelper(r'$SinglePageSuccessResponseBodyAllOf')
          ..add('data', data))
        .toString();
  }
}

class $SinglePageSuccessResponseBodyAllOfBuilder
    implements
        Builder<$SinglePageSuccessResponseBodyAllOf,
            $SinglePageSuccessResponseBodyAllOfBuilder>,
        SinglePageSuccessResponseBodyAllOfBuilder {
  _$$SinglePageSuccessResponseBodyAllOf? _$v;

  SinglePageResponseDataBuilder? _data;
  SinglePageResponseDataBuilder get data =>
      _$this._data ??= new SinglePageResponseDataBuilder();
  set data(covariant SinglePageResponseDataBuilder? data) =>
      _$this._data = data;

  $SinglePageSuccessResponseBodyAllOfBuilder() {
    $SinglePageSuccessResponseBodyAllOf._defaults(this);
  }

  $SinglePageSuccessResponseBodyAllOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant $SinglePageSuccessResponseBodyAllOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$$SinglePageSuccessResponseBodyAllOf;
  }

  @override
  void update(
      void Function($SinglePageSuccessResponseBodyAllOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $SinglePageSuccessResponseBodyAllOf build() => _build();

  _$$SinglePageSuccessResponseBodyAllOf _build() {
    _$$SinglePageSuccessResponseBodyAllOf _$result;
    try {
      _$result = _$v ??
          new _$$SinglePageSuccessResponseBodyAllOf._(data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'$SinglePageSuccessResponseBodyAllOf',
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
