// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SubscriptionState extends SubscriptionState {
  @override
  final int? v;
  @override
  final String? id;
  @override
  final bool? subscribed;
  @override
  final bool? canSubscribe;
  @override
  final bool? canUnsubscribe;
  @override
  final String? statusMessage;
  @override
  final SubscriptionConfig? config;
  @override
  final BuiltList<SubscriptionField>? fields;
  @override
  final BuiltList<SubscriptionOption>? options;
  @override
  final BuiltList<String>? tickets;
  @override
  final int? placesLimit;
  @override
  final int? placesLeft;

  factory _$SubscriptionState(
          [void Function(SubscriptionStateBuilder)? updates]) =>
      (new SubscriptionStateBuilder()..update(updates))._build();

  _$SubscriptionState._(
      {this.v,
      this.id,
      this.subscribed,
      this.canSubscribe,
      this.canUnsubscribe,
      this.statusMessage,
      this.config,
      this.fields,
      this.options,
      this.tickets,
      this.placesLimit,
      this.placesLeft})
      : super._();

  @override
  SubscriptionState rebuild(void Function(SubscriptionStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscriptionStateBuilder toBuilder() =>
      new SubscriptionStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubscriptionState &&
        v == other.v &&
        id == other.id &&
        subscribed == other.subscribed &&
        canSubscribe == other.canSubscribe &&
        canUnsubscribe == other.canUnsubscribe &&
        statusMessage == other.statusMessage &&
        config == other.config &&
        fields == other.fields &&
        options == other.options &&
        tickets == other.tickets &&
        placesLimit == other.placesLimit &&
        placesLeft == other.placesLeft;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, v.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, subscribed.hashCode);
    _$hash = $jc(_$hash, canSubscribe.hashCode);
    _$hash = $jc(_$hash, canUnsubscribe.hashCode);
    _$hash = $jc(_$hash, statusMessage.hashCode);
    _$hash = $jc(_$hash, config.hashCode);
    _$hash = $jc(_$hash, fields.hashCode);
    _$hash = $jc(_$hash, options.hashCode);
    _$hash = $jc(_$hash, tickets.hashCode);
    _$hash = $jc(_$hash, placesLimit.hashCode);
    _$hash = $jc(_$hash, placesLeft.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SubscriptionState')
          ..add('v', v)
          ..add('id', id)
          ..add('subscribed', subscribed)
          ..add('canSubscribe', canSubscribe)
          ..add('canUnsubscribe', canUnsubscribe)
          ..add('statusMessage', statusMessage)
          ..add('config', config)
          ..add('fields', fields)
          ..add('options', options)
          ..add('tickets', tickets)
          ..add('placesLimit', placesLimit)
          ..add('placesLeft', placesLeft))
        .toString();
  }
}

class SubscriptionStateBuilder
    implements Builder<SubscriptionState, SubscriptionStateBuilder> {
  _$SubscriptionState? _$v;

  int? _v;
  int? get v => _$this._v;
  set v(int? v) => _$this._v = v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  bool? _subscribed;
  bool? get subscribed => _$this._subscribed;
  set subscribed(bool? subscribed) => _$this._subscribed = subscribed;

  bool? _canSubscribe;
  bool? get canSubscribe => _$this._canSubscribe;
  set canSubscribe(bool? canSubscribe) => _$this._canSubscribe = canSubscribe;

  bool? _canUnsubscribe;
  bool? get canUnsubscribe => _$this._canUnsubscribe;
  set canUnsubscribe(bool? canUnsubscribe) =>
      _$this._canUnsubscribe = canUnsubscribe;

  String? _statusMessage;
  String? get statusMessage => _$this._statusMessage;
  set statusMessage(String? statusMessage) =>
      _$this._statusMessage = statusMessage;

  SubscriptionConfigBuilder? _config;
  SubscriptionConfigBuilder get config =>
      _$this._config ??= new SubscriptionConfigBuilder();
  set config(SubscriptionConfigBuilder? config) => _$this._config = config;

  ListBuilder<SubscriptionField>? _fields;
  ListBuilder<SubscriptionField> get fields =>
      _$this._fields ??= new ListBuilder<SubscriptionField>();
  set fields(ListBuilder<SubscriptionField>? fields) => _$this._fields = fields;

  ListBuilder<SubscriptionOption>? _options;
  ListBuilder<SubscriptionOption> get options =>
      _$this._options ??= new ListBuilder<SubscriptionOption>();
  set options(ListBuilder<SubscriptionOption>? options) =>
      _$this._options = options;

  ListBuilder<String>? _tickets;
  ListBuilder<String> get tickets =>
      _$this._tickets ??= new ListBuilder<String>();
  set tickets(ListBuilder<String>? tickets) => _$this._tickets = tickets;

  int? _placesLimit;
  int? get placesLimit => _$this._placesLimit;
  set placesLimit(int? placesLimit) => _$this._placesLimit = placesLimit;

  int? _placesLeft;
  int? get placesLeft => _$this._placesLeft;
  set placesLeft(int? placesLeft) => _$this._placesLeft = placesLeft;

  SubscriptionStateBuilder() {
    SubscriptionState._defaults(this);
  }

  SubscriptionStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _v = $v.v;
      _id = $v.id;
      _subscribed = $v.subscribed;
      _canSubscribe = $v.canSubscribe;
      _canUnsubscribe = $v.canUnsubscribe;
      _statusMessage = $v.statusMessage;
      _config = $v.config?.toBuilder();
      _fields = $v.fields?.toBuilder();
      _options = $v.options?.toBuilder();
      _tickets = $v.tickets?.toBuilder();
      _placesLimit = $v.placesLimit;
      _placesLeft = $v.placesLeft;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubscriptionState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubscriptionState;
  }

  @override
  void update(void Function(SubscriptionStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubscriptionState build() => _build();

  _$SubscriptionState _build() {
    _$SubscriptionState _$result;
    try {
      _$result = _$v ??
          new _$SubscriptionState._(
              v: v,
              id: id,
              subscribed: subscribed,
              canSubscribe: canSubscribe,
              canUnsubscribe: canUnsubscribe,
              statusMessage: statusMessage,
              config: _config?.build(),
              fields: _fields?.build(),
              options: _options?.build(),
              tickets: _tickets?.build(),
              placesLimit: placesLimit,
              placesLeft: placesLeft);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'config';
        _config?.build();
        _$failedField = 'fields';
        _fields?.build();
        _$failedField = 'options';
        _options?.build();
        _$failedField = 'tickets';
        _tickets?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SubscriptionState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
