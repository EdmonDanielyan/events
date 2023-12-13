// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uni_events_get_detail_resp_body_all_of_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UniEventsGetDetailRespBodyAllOfData
    extends UniEventsGetDetailRespBodyAllOfData {
  @override
  final UniEventDetail? event;
  @override
  final SubscriptionState? subscription;

  factory _$UniEventsGetDetailRespBodyAllOfData(
          [void Function(UniEventsGetDetailRespBodyAllOfDataBuilder)?
              updates]) =>
      (new UniEventsGetDetailRespBodyAllOfDataBuilder()..update(updates))
          ._build();

  _$UniEventsGetDetailRespBodyAllOfData._({this.event, this.subscription})
      : super._();

  @override
  UniEventsGetDetailRespBodyAllOfData rebuild(
          void Function(UniEventsGetDetailRespBodyAllOfDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UniEventsGetDetailRespBodyAllOfDataBuilder toBuilder() =>
      new UniEventsGetDetailRespBodyAllOfDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UniEventsGetDetailRespBodyAllOfData &&
        event == other.event &&
        subscription == other.subscription;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, event.hashCode);
    _$hash = $jc(_$hash, subscription.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UniEventsGetDetailRespBodyAllOfData')
          ..add('event', event)
          ..add('subscription', subscription))
        .toString();
  }
}

class UniEventsGetDetailRespBodyAllOfDataBuilder
    implements
        Builder<UniEventsGetDetailRespBodyAllOfData,
            UniEventsGetDetailRespBodyAllOfDataBuilder> {
  _$UniEventsGetDetailRespBodyAllOfData? _$v;

  UniEventDetailBuilder? _event;
  UniEventDetailBuilder get event =>
      _$this._event ??= new UniEventDetailBuilder();
  set event(UniEventDetailBuilder? event) => _$this._event = event;

  SubscriptionStateBuilder? _subscription;
  SubscriptionStateBuilder get subscription =>
      _$this._subscription ??= new SubscriptionStateBuilder();
  set subscription(SubscriptionStateBuilder? subscription) =>
      _$this._subscription = subscription;

  UniEventsGetDetailRespBodyAllOfDataBuilder() {
    UniEventsGetDetailRespBodyAllOfData._defaults(this);
  }

  UniEventsGetDetailRespBodyAllOfDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _event = $v.event?.toBuilder();
      _subscription = $v.subscription?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UniEventsGetDetailRespBodyAllOfData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UniEventsGetDetailRespBodyAllOfData;
  }

  @override
  void update(
      void Function(UniEventsGetDetailRespBodyAllOfDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UniEventsGetDetailRespBodyAllOfData build() => _build();

  _$UniEventsGetDetailRespBodyAllOfData _build() {
    _$UniEventsGetDetailRespBodyAllOfData _$result;
    try {
      _$result = _$v ??
          new _$UniEventsGetDetailRespBodyAllOfData._(
              event: _event?.build(), subscription: _subscription?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'event';
        _event?.build();
        _$failedField = 'subscription';
        _subscription?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UniEventsGetDetailRespBodyAllOfData',
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
