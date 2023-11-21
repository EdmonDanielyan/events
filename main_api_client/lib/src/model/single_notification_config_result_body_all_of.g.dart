// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_notification_config_result_body_all_of.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class SingleNotificationConfigResultBodyAllOfBuilder {
  void replace(SingleNotificationConfigResultBodyAllOf other);
  void update(
      void Function(SingleNotificationConfigResultBodyAllOfBuilder) updates);
  NotificationSubStateBuilder get data;
  set data(NotificationSubStateBuilder? data);
}

class _$$SingleNotificationConfigResultBodyAllOf
    extends $SingleNotificationConfigResultBodyAllOf {
  @override
  final NotificationSubState? data;

  factory _$$SingleNotificationConfigResultBodyAllOf(
          [void Function($SingleNotificationConfigResultBodyAllOfBuilder)?
              updates]) =>
      (new $SingleNotificationConfigResultBodyAllOfBuilder()..update(updates))
          ._build();

  _$$SingleNotificationConfigResultBodyAllOf._({this.data}) : super._();

  @override
  $SingleNotificationConfigResultBodyAllOf rebuild(
          void Function($SingleNotificationConfigResultBodyAllOfBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $SingleNotificationConfigResultBodyAllOfBuilder toBuilder() =>
      new $SingleNotificationConfigResultBodyAllOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $SingleNotificationConfigResultBodyAllOf &&
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
            r'$SingleNotificationConfigResultBodyAllOf')
          ..add('data', data))
        .toString();
  }
}

class $SingleNotificationConfigResultBodyAllOfBuilder
    implements
        Builder<$SingleNotificationConfigResultBodyAllOf,
            $SingleNotificationConfigResultBodyAllOfBuilder>,
        SingleNotificationConfigResultBodyAllOfBuilder {
  _$$SingleNotificationConfigResultBodyAllOf? _$v;

  NotificationSubStateBuilder? _data;
  NotificationSubStateBuilder get data =>
      _$this._data ??= new NotificationSubStateBuilder();
  set data(covariant NotificationSubStateBuilder? data) => _$this._data = data;

  $SingleNotificationConfigResultBodyAllOfBuilder() {
    $SingleNotificationConfigResultBodyAllOf._defaults(this);
  }

  $SingleNotificationConfigResultBodyAllOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant $SingleNotificationConfigResultBodyAllOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$$SingleNotificationConfigResultBodyAllOf;
  }

  @override
  void update(
      void Function($SingleNotificationConfigResultBodyAllOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $SingleNotificationConfigResultBodyAllOf build() => _build();

  _$$SingleNotificationConfigResultBodyAllOf _build() {
    _$$SingleNotificationConfigResultBodyAllOf _$result;
    try {
      _$result = _$v ??
          new _$$SingleNotificationConfigResultBodyAllOf._(
              data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'$SingleNotificationConfigResultBodyAllOf',
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
