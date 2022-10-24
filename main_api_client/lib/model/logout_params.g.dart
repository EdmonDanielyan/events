// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'logout_params.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LogoutParams> _$logoutParamsSerializer =
    new _$LogoutParamsSerializer();

class _$LogoutParamsSerializer implements StructuredSerializer<LogoutParams> {
  @override
  final Iterable<Type> types = const [LogoutParams, _$LogoutParams];
  @override
  final String wireName = 'LogoutParams';

  @override
  Iterable<Object> serialize(Serializers serializers, LogoutParams object,
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
  LogoutParams deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LogoutParamsBuilder();

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

class _$LogoutParams extends LogoutParams {
  @override
  final String token;

  factory _$LogoutParams([void Function(LogoutParamsBuilder) updates]) =>
      (new LogoutParamsBuilder()..update(updates))._build();

  _$LogoutParams._({this.token}) : super._();

  @override
  LogoutParams rebuild(void Function(LogoutParamsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LogoutParamsBuilder toBuilder() => new LogoutParamsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LogoutParams && token == other.token;
  }

  @override
  int get hashCode {
    return $jf($jc(0, token.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LogoutParams')..add('token', token))
        .toString();
  }
}

class LogoutParamsBuilder
    implements Builder<LogoutParams, LogoutParamsBuilder> {
  _$LogoutParams _$v;

  String _token;
  String get token => _$this._token;
  set token(String token) => _$this._token = token;

  LogoutParamsBuilder() {
    LogoutParams._initializeBuilder(this);
  }

  LogoutParamsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LogoutParams other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LogoutParams;
  }

  @override
  void update(void Function(LogoutParamsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  LogoutParams build() => _build();

  _$LogoutParams _build() {
    final _$result = _$v ?? new _$LogoutParams._(token: token);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
