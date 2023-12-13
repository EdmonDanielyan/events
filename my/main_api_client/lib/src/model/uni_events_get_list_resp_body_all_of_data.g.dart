// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uni_events_get_list_resp_body_all_of_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UniEventsGetListRespBodyAllOfData
    extends UniEventsGetListRespBodyAllOfData {
  @override
  final int? totalCount;
  @override
  final BuiltList<UniEventShort>? events;

  factory _$UniEventsGetListRespBodyAllOfData(
          [void Function(UniEventsGetListRespBodyAllOfDataBuilder)? updates]) =>
      (new UniEventsGetListRespBodyAllOfDataBuilder()..update(updates))
          ._build();

  _$UniEventsGetListRespBodyAllOfData._({this.totalCount, this.events})
      : super._();

  @override
  UniEventsGetListRespBodyAllOfData rebuild(
          void Function(UniEventsGetListRespBodyAllOfDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UniEventsGetListRespBodyAllOfDataBuilder toBuilder() =>
      new UniEventsGetListRespBodyAllOfDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UniEventsGetListRespBodyAllOfData &&
        totalCount == other.totalCount &&
        events == other.events;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, totalCount.hashCode);
    _$hash = $jc(_$hash, events.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UniEventsGetListRespBodyAllOfData')
          ..add('totalCount', totalCount)
          ..add('events', events))
        .toString();
  }
}

class UniEventsGetListRespBodyAllOfDataBuilder
    implements
        Builder<UniEventsGetListRespBodyAllOfData,
            UniEventsGetListRespBodyAllOfDataBuilder> {
  _$UniEventsGetListRespBodyAllOfData? _$v;

  int? _totalCount;
  int? get totalCount => _$this._totalCount;
  set totalCount(int? totalCount) => _$this._totalCount = totalCount;

  ListBuilder<UniEventShort>? _events;
  ListBuilder<UniEventShort> get events =>
      _$this._events ??= new ListBuilder<UniEventShort>();
  set events(ListBuilder<UniEventShort>? events) => _$this._events = events;

  UniEventsGetListRespBodyAllOfDataBuilder() {
    UniEventsGetListRespBodyAllOfData._defaults(this);
  }

  UniEventsGetListRespBodyAllOfDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _totalCount = $v.totalCount;
      _events = $v.events?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UniEventsGetListRespBodyAllOfData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UniEventsGetListRespBodyAllOfData;
  }

  @override
  void update(
      void Function(UniEventsGetListRespBodyAllOfDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UniEventsGetListRespBodyAllOfData build() => _build();

  _$UniEventsGetListRespBodyAllOfData _build() {
    _$UniEventsGetListRespBodyAllOfData _$result;
    try {
      _$result = _$v ??
          new _$UniEventsGetListRespBodyAllOfData._(
              totalCount: totalCount, events: _events?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'events';
        _events?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UniEventsGetListRespBodyAllOfData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
