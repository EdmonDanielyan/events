// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_config.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SubscriptionConfig extends SubscriptionConfig {
  @override
  final SubscriptionConfigOptions? options;
  @override
  final SubscriptionConfigChildren? children;
  @override
  final SubscriptionConfigVisitors? visitors;

  factory _$SubscriptionConfig(
          [void Function(SubscriptionConfigBuilder)? updates]) =>
      (new SubscriptionConfigBuilder()..update(updates))._build();

  _$SubscriptionConfig._({this.options, this.children, this.visitors})
      : super._();

  @override
  SubscriptionConfig rebuild(
          void Function(SubscriptionConfigBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscriptionConfigBuilder toBuilder() =>
      new SubscriptionConfigBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubscriptionConfig &&
        options == other.options &&
        children == other.children &&
        visitors == other.visitors;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, options.hashCode);
    _$hash = $jc(_$hash, children.hashCode);
    _$hash = $jc(_$hash, visitors.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SubscriptionConfig')
          ..add('options', options)
          ..add('children', children)
          ..add('visitors', visitors))
        .toString();
  }
}

class SubscriptionConfigBuilder
    implements Builder<SubscriptionConfig, SubscriptionConfigBuilder> {
  _$SubscriptionConfig? _$v;

  SubscriptionConfigOptionsBuilder? _options;
  SubscriptionConfigOptionsBuilder get options =>
      _$this._options ??= new SubscriptionConfigOptionsBuilder();
  set options(SubscriptionConfigOptionsBuilder? options) =>
      _$this._options = options;

  SubscriptionConfigChildrenBuilder? _children;
  SubscriptionConfigChildrenBuilder get children =>
      _$this._children ??= new SubscriptionConfigChildrenBuilder();
  set children(SubscriptionConfigChildrenBuilder? children) =>
      _$this._children = children;

  SubscriptionConfigVisitorsBuilder? _visitors;
  SubscriptionConfigVisitorsBuilder get visitors =>
      _$this._visitors ??= new SubscriptionConfigVisitorsBuilder();
  set visitors(SubscriptionConfigVisitorsBuilder? visitors) =>
      _$this._visitors = visitors;

  SubscriptionConfigBuilder() {
    SubscriptionConfig._defaults(this);
  }

  SubscriptionConfigBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _options = $v.options?.toBuilder();
      _children = $v.children?.toBuilder();
      _visitors = $v.visitors?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubscriptionConfig other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubscriptionConfig;
  }

  @override
  void update(void Function(SubscriptionConfigBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubscriptionConfig build() => _build();

  _$SubscriptionConfig _build() {
    _$SubscriptionConfig _$result;
    try {
      _$result = _$v ??
          new _$SubscriptionConfig._(
              options: _options?.build(),
              children: _children?.build(),
              visitors: _visitors?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'options';
        _options?.build();
        _$failedField = 'children';
        _children?.build();
        _$failedField = 'visitors';
        _visitors?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SubscriptionConfig', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
