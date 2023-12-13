// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_config_visitors.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SubscriptionConfigVisitors extends SubscriptionConfigVisitors {
  @override
  final bool? enable;

  factory _$SubscriptionConfigVisitors(
          [void Function(SubscriptionConfigVisitorsBuilder)? updates]) =>
      (new SubscriptionConfigVisitorsBuilder()..update(updates))._build();

  _$SubscriptionConfigVisitors._({this.enable}) : super._();

  @override
  SubscriptionConfigVisitors rebuild(
          void Function(SubscriptionConfigVisitorsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscriptionConfigVisitorsBuilder toBuilder() =>
      new SubscriptionConfigVisitorsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubscriptionConfigVisitors && enable == other.enable;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enable.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SubscriptionConfigVisitors')
          ..add('enable', enable))
        .toString();
  }
}

class SubscriptionConfigVisitorsBuilder
    implements
        Builder<SubscriptionConfigVisitors, SubscriptionConfigVisitorsBuilder> {
  _$SubscriptionConfigVisitors? _$v;

  bool? _enable;
  bool? get enable => _$this._enable;
  set enable(bool? enable) => _$this._enable = enable;

  SubscriptionConfigVisitorsBuilder() {
    SubscriptionConfigVisitors._defaults(this);
  }

  SubscriptionConfigVisitorsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enable = $v.enable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubscriptionConfigVisitors other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubscriptionConfigVisitors;
  }

  @override
  void update(void Function(SubscriptionConfigVisitorsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubscriptionConfigVisitors build() => _build();

  _$SubscriptionConfigVisitors _build() {
    final _$result = _$v ?? new _$SubscriptionConfigVisitors._(enable: enable);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
