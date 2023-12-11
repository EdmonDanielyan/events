// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uni_events_get_detail_resp_body_all_of.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class UniEventsGetDetailRespBodyAllOfBuilder {
  void replace(UniEventsGetDetailRespBodyAllOf other);
  void update(void Function(UniEventsGetDetailRespBodyAllOfBuilder) updates);
  UniEventsGetDetailRespBodyAllOfDataBuilder get data;
  set data(UniEventsGetDetailRespBodyAllOfDataBuilder? data);
}

class _$$UniEventsGetDetailRespBodyAllOf
    extends $UniEventsGetDetailRespBodyAllOf {
  @override
  final UniEventsGetDetailRespBodyAllOfData data;

  factory _$$UniEventsGetDetailRespBodyAllOf(
          [void Function($UniEventsGetDetailRespBodyAllOfBuilder)? updates]) =>
      (new $UniEventsGetDetailRespBodyAllOfBuilder()..update(updates))._build();

  _$$UniEventsGetDetailRespBodyAllOf._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'$UniEventsGetDetailRespBodyAllOf', 'data');
  }

  @override
  $UniEventsGetDetailRespBodyAllOf rebuild(
          void Function($UniEventsGetDetailRespBodyAllOfBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $UniEventsGetDetailRespBodyAllOfBuilder toBuilder() =>
      new $UniEventsGetDetailRespBodyAllOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $UniEventsGetDetailRespBodyAllOf && data == other.data;
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
    return (newBuiltValueToStringHelper(r'$UniEventsGetDetailRespBodyAllOf')
          ..add('data', data))
        .toString();
  }
}

class $UniEventsGetDetailRespBodyAllOfBuilder
    implements
        Builder<$UniEventsGetDetailRespBodyAllOf,
            $UniEventsGetDetailRespBodyAllOfBuilder>,
        UniEventsGetDetailRespBodyAllOfBuilder {
  _$$UniEventsGetDetailRespBodyAllOf? _$v;

  UniEventsGetDetailRespBodyAllOfDataBuilder? _data;
  UniEventsGetDetailRespBodyAllOfDataBuilder get data =>
      _$this._data ??= new UniEventsGetDetailRespBodyAllOfDataBuilder();
  set data(covariant UniEventsGetDetailRespBodyAllOfDataBuilder? data) =>
      _$this._data = data;

  $UniEventsGetDetailRespBodyAllOfBuilder() {
    $UniEventsGetDetailRespBodyAllOf._defaults(this);
  }

  $UniEventsGetDetailRespBodyAllOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant $UniEventsGetDetailRespBodyAllOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$$UniEventsGetDetailRespBodyAllOf;
  }

  @override
  void update(void Function($UniEventsGetDetailRespBodyAllOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $UniEventsGetDetailRespBodyAllOf build() => _build();

  _$$UniEventsGetDetailRespBodyAllOf _build() {
    _$$UniEventsGetDetailRespBodyAllOf _$result;
    try {
      _$result =
          _$v ?? new _$$UniEventsGetDetailRespBodyAllOf._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'$UniEventsGetDetailRespBodyAllOf', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
