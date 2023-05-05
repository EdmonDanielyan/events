// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'single_notification_config_result_body_all_of.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SingleNotificationConfigResultBodyAllOf>
    _$singleNotificationConfigResultBodyAllOfSerializer =
    new _$SingleNotificationConfigResultBodyAllOfSerializer();

class _$SingleNotificationConfigResultBodyAllOfSerializer
    implements StructuredSerializer<SingleNotificationConfigResultBodyAllOf> {
  @override
  final Iterable<Type> types = const [
    SingleNotificationConfigResultBodyAllOf,
    _$SingleNotificationConfigResultBodyAllOf
  ];
  @override
  final String wireName = 'SingleNotificationConfigResultBodyAllOf';

  @override
  Iterable<Object> serialize(
      Serializers serializers, SingleNotificationConfigResultBodyAllOf object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NotificationSubState)));
    }
    return result;
  }

  @override
  SingleNotificationConfigResultBodyAllOf deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SingleNotificationConfigResultBodyAllOfBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NotificationSubState))
              as NotificationSubState);
          break;
      }
    }

    return result.build();
  }
}

class _$SingleNotificationConfigResultBodyAllOf
    extends SingleNotificationConfigResultBodyAllOf {
  @override
  final NotificationSubState data;

  factory _$SingleNotificationConfigResultBodyAllOf(
          [void Function(SingleNotificationConfigResultBodyAllOfBuilder)
              updates]) =>
      (new SingleNotificationConfigResultBodyAllOfBuilder()..update(updates))
          ._build();

  _$SingleNotificationConfigResultBodyAllOf._({this.data}) : super._();

  @override
  SingleNotificationConfigResultBodyAllOf rebuild(
          void Function(SingleNotificationConfigResultBodyAllOfBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SingleNotificationConfigResultBodyAllOfBuilder toBuilder() =>
      new SingleNotificationConfigResultBodyAllOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SingleNotificationConfigResultBodyAllOf &&
        data == other.data;
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
            r'SingleNotificationConfigResultBodyAllOf')
          ..add('data', data))
        .toString();
  }
}

class SingleNotificationConfigResultBodyAllOfBuilder
    implements
        Builder<SingleNotificationConfigResultBodyAllOf,
            SingleNotificationConfigResultBodyAllOfBuilder> {
  _$SingleNotificationConfigResultBodyAllOf _$v;

  NotificationSubStateBuilder _data;
  NotificationSubStateBuilder get data =>
      _$this._data ??= new NotificationSubStateBuilder();
  set data(NotificationSubStateBuilder data) => _$this._data = data;

  SingleNotificationConfigResultBodyAllOfBuilder() {
    SingleNotificationConfigResultBodyAllOf._initializeBuilder(this);
  }

  SingleNotificationConfigResultBodyAllOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SingleNotificationConfigResultBodyAllOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SingleNotificationConfigResultBodyAllOf;
  }

  @override
  void update(
      void Function(SingleNotificationConfigResultBodyAllOfBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  SingleNotificationConfigResultBodyAllOf build() => _build();

  _$SingleNotificationConfigResultBodyAllOf _build() {
    _$SingleNotificationConfigResultBodyAllOf _$result;
    try {
      _$result = _$v ??
          new _$SingleNotificationConfigResultBodyAllOf._(data: _data?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SingleNotificationConfigResultBodyAllOf',
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
