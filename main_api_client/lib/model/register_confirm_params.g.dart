// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'register_confirm_params.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RegisterConfirmParams> _$registerConfirmParamsSerializer =
    new _$RegisterConfirmParamsSerializer();

class _$RegisterConfirmParamsSerializer
    implements StructuredSerializer<RegisterConfirmParams> {
  @override
  final Iterable<Type> types = const [
    RegisterConfirmParams,
    _$RegisterConfirmParams
  ];
  @override
  final String wireName = 'RegisterConfirmParams';

  @override
  Iterable<Object> serialize(
      Serializers serializers, RegisterConfirmParams object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  RegisterConfirmParams deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RegisterConfirmParamsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$RegisterConfirmParams extends RegisterConfirmParams {
  @override
  final String phone;
  @override
  final int code;

  factory _$RegisterConfirmParams(
          [void Function(RegisterConfirmParamsBuilder) updates]) =>
      (new RegisterConfirmParamsBuilder()..update(updates))._build();

  _$RegisterConfirmParams._({this.phone, this.code}) : super._();

  @override
  RegisterConfirmParams rebuild(
          void Function(RegisterConfirmParamsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterConfirmParamsBuilder toBuilder() =>
      new RegisterConfirmParamsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterConfirmParams &&
        phone == other.phone &&
        code == other.code;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterConfirmParams')
          ..add('phone', phone)
          ..add('code', code))
        .toString();
  }
}

class RegisterConfirmParamsBuilder
    implements Builder<RegisterConfirmParams, RegisterConfirmParamsBuilder> {
  _$RegisterConfirmParams _$v;

  String _phone;
  String get phone => _$this._phone;
  set phone(String phone) => _$this._phone = phone;

  int _code;
  int get code => _$this._code;
  set code(int code) => _$this._code = code;

  RegisterConfirmParamsBuilder() {
    RegisterConfirmParams._initializeBuilder(this);
  }

  RegisterConfirmParamsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phone = $v.phone;
      _code = $v.code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterConfirmParams other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RegisterConfirmParams;
  }

  @override
  void update(void Function(RegisterConfirmParamsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterConfirmParams build() => _build();

  _$RegisterConfirmParams _build() {
    final _$result =
        _$v ?? new _$RegisterConfirmParams._(phone: phone, code: code);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
