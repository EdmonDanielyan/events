// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'refresh_token_params.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RefreshTokenParams> _$refreshTokenParamsSerializer =
    new _$RefreshTokenParamsSerializer();

class _$RefreshTokenParamsSerializer
    implements StructuredSerializer<RefreshTokenParams> {
  @override
  final Iterable<Type> types = const [RefreshTokenParams, _$RefreshTokenParams];
  @override
  final String wireName = 'RefreshTokenParams';

  @override
  Iterable<Object> serialize(Serializers serializers, RefreshTokenParams object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.token;
    if (value != null) {
      result
        ..add('token')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  RefreshTokenParams deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RefreshTokenParamsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'token':
          result.token = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$RefreshTokenParams extends RefreshTokenParams {
  @override
  final String token;

  factory _$RefreshTokenParams(
          [void Function(RefreshTokenParamsBuilder) updates]) =>
      (new RefreshTokenParamsBuilder()..update(updates)).build();

  _$RefreshTokenParams._({this.token}) : super._();

  @override
  RefreshTokenParams rebuild(
          void Function(RefreshTokenParamsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RefreshTokenParamsBuilder toBuilder() =>
      new RefreshTokenParamsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RefreshTokenParams && token == other.token;
  }

  @override
  int get hashCode {
    return $jf($jc(0, token.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RefreshTokenParams')
          ..add('token', token))
        .toString();
  }
}

class RefreshTokenParamsBuilder
    implements Builder<RefreshTokenParams, RefreshTokenParamsBuilder> {
  _$RefreshTokenParams _$v;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  RefreshTokenParamsBuilder() {
    RefreshTokenParams._initializeBuilder(this);
  }

  RefreshTokenParamsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RefreshTokenParams other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RefreshTokenParams;
  }

  @override
  void update(void Function(RefreshTokenParamsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RefreshTokenParams build() {
    final _$result = _$v ?? new _$RefreshTokenParams._(token: token);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
