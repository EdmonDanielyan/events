// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_config_children.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SubscriptionConfigChildren extends SubscriptionConfigChildren {
  @override
  final bool? enable;
  @override
  final bool? confirmed;
  @override
  final bool? birthday;

  factory _$SubscriptionConfigChildren(
          [void Function(SubscriptionConfigChildrenBuilder)? updates]) =>
      (new SubscriptionConfigChildrenBuilder()..update(updates))._build();

  _$SubscriptionConfigChildren._({this.enable, this.confirmed, this.birthday})
      : super._();

  @override
  SubscriptionConfigChildren rebuild(
          void Function(SubscriptionConfigChildrenBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscriptionConfigChildrenBuilder toBuilder() =>
      new SubscriptionConfigChildrenBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubscriptionConfigChildren &&
        enable == other.enable &&
        confirmed == other.confirmed &&
        birthday == other.birthday;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, enable.hashCode);
    _$hash = $jc(_$hash, confirmed.hashCode);
    _$hash = $jc(_$hash, birthday.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SubscriptionConfigChildren')
          ..add('enable', enable)
          ..add('confirmed', confirmed)
          ..add('birthday', birthday))
        .toString();
  }
}

class SubscriptionConfigChildrenBuilder
    implements
        Builder<SubscriptionConfigChildren, SubscriptionConfigChildrenBuilder> {
  _$SubscriptionConfigChildren? _$v;

  bool? _enable;
  bool? get enable => _$this._enable;
  set enable(bool? enable) => _$this._enable = enable;

  bool? _confirmed;
  bool? get confirmed => _$this._confirmed;
  set confirmed(bool? confirmed) => _$this._confirmed = confirmed;

  bool? _birthday;
  bool? get birthday => _$this._birthday;
  set birthday(bool? birthday) => _$this._birthday = birthday;

  SubscriptionConfigChildrenBuilder() {
    SubscriptionConfigChildren._defaults(this);
  }

  SubscriptionConfigChildrenBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enable = $v.enable;
      _confirmed = $v.confirmed;
      _birthday = $v.birthday;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubscriptionConfigChildren other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubscriptionConfigChildren;
  }

  @override
  void update(void Function(SubscriptionConfigChildrenBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubscriptionConfigChildren build() => _build();

  _$SubscriptionConfigChildren _build() {
    final _$result = _$v ??
        new _$SubscriptionConfigChildren._(
            enable: enable, confirmed: confirmed, birthday: birthday);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
