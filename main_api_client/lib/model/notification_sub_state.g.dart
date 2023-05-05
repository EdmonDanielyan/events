// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'notification_sub_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NotificationSubState> _$notificationSubStateSerializer =
    new _$NotificationSubStateSerializer();

class _$NotificationSubStateSerializer
    implements StructuredSerializer<NotificationSubState> {
  @override
  final Iterable<Type> types = const [
    NotificationSubState,
    _$NotificationSubState
  ];
  @override
  final String wireName = 'NotificationSubState';

  @override
  Iterable<Object> serialize(
      Serializers serializers, NotificationSubState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.value;
    if (value != null) {
      result
        ..add('value')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  NotificationSubState deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotificationSubStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$NotificationSubState extends NotificationSubState {
  @override
  final bool value;

  factory _$NotificationSubState(
          [void Function(NotificationSubStateBuilder) updates]) =>
      (new NotificationSubStateBuilder()..update(updates))._build();

  _$NotificationSubState._({this.value}) : super._();

  @override
  NotificationSubState rebuild(
          void Function(NotificationSubStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationSubStateBuilder toBuilder() =>
      new NotificationSubStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationSubState && value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationSubState')
          ..add('value', value))
        .toString();
  }
}

class NotificationSubStateBuilder
    implements Builder<NotificationSubState, NotificationSubStateBuilder> {
  _$NotificationSubState _$v;

  bool _value;
  bool get value => _$this._value;
  set value(bool value) => _$this._value = value;

  NotificationSubStateBuilder() {
    NotificationSubState._initializeBuilder(this);
  }

  NotificationSubStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationSubState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationSubState;
  }

  @override
  void update(void Function(NotificationSubStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationSubState build() => _build();

  _$NotificationSubState _build() {
    final _$result = _$v ?? new _$NotificationSubState._(value: value);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
