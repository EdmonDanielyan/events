// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uni_sub_get_state_resp_body_all_of.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class UniSubGetStateRespBodyAllOfBuilder {
  void replace(UniSubGetStateRespBodyAllOf other);
  void update(void Function(UniSubGetStateRespBodyAllOfBuilder) updates);
  SubscriptionStateBuilder get data;
  set data(SubscriptionStateBuilder? data);
}

class _$$UniSubGetStateRespBodyAllOf extends $UniSubGetStateRespBodyAllOf {
  @override
  final SubscriptionState data;

  factory _$$UniSubGetStateRespBodyAllOf(
          [void Function($UniSubGetStateRespBodyAllOfBuilder)? updates]) =>
      (new $UniSubGetStateRespBodyAllOfBuilder()..update(updates))._build();

  _$$UniSubGetStateRespBodyAllOf._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'$UniSubGetStateRespBodyAllOf', 'data');
  }

  @override
  $UniSubGetStateRespBodyAllOf rebuild(
          void Function($UniSubGetStateRespBodyAllOfBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $UniSubGetStateRespBodyAllOfBuilder toBuilder() =>
      new $UniSubGetStateRespBodyAllOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $UniSubGetStateRespBodyAllOf && data == other.data;
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
    return (newBuiltValueToStringHelper(r'$UniSubGetStateRespBodyAllOf')
          ..add('data', data))
        .toString();
  }
}

class $UniSubGetStateRespBodyAllOfBuilder
    implements
        Builder<$UniSubGetStateRespBodyAllOf,
            $UniSubGetStateRespBodyAllOfBuilder>,
        UniSubGetStateRespBodyAllOfBuilder {
  _$$UniSubGetStateRespBodyAllOf? _$v;

  SubscriptionStateBuilder? _data;
  SubscriptionStateBuilder get data =>
      _$this._data ??= new SubscriptionStateBuilder();
  set data(covariant SubscriptionStateBuilder? data) => _$this._data = data;

  $UniSubGetStateRespBodyAllOfBuilder() {
    $UniSubGetStateRespBodyAllOf._defaults(this);
  }

  $UniSubGetStateRespBodyAllOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant $UniSubGetStateRespBodyAllOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$$UniSubGetStateRespBodyAllOf;
  }

  @override
  void update(void Function($UniSubGetStateRespBodyAllOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $UniSubGetStateRespBodyAllOf build() => _build();

  _$$UniSubGetStateRespBodyAllOf _build() {
    _$$UniSubGetStateRespBodyAllOf _$result;
    try {
      _$result =
          _$v ?? new _$$UniSubGetStateRespBodyAllOf._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'$UniSubGetStateRespBodyAllOf', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
