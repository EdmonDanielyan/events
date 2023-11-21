// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_sub_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NotificationSubState extends NotificationSubState {
  @override
  final bool? value;

  factory _$NotificationSubState(
          [void Function(NotificationSubStateBuilder)? updates]) =>
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
  _$NotificationSubState? _$v;

  bool? _value;
  bool? get value => _$this._value;
  set value(bool? value) => _$this._value = value;

  NotificationSubStateBuilder() {
    NotificationSubState._defaults(this);
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
  void update(void Function(NotificationSubStateBuilder)? updates) {
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
