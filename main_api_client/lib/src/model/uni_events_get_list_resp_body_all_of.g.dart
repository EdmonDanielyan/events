// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uni_events_get_list_resp_body_all_of.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class UniEventsGetListRespBodyAllOfBuilder {
  void replace(UniEventsGetListRespBodyAllOf other);
  void update(void Function(UniEventsGetListRespBodyAllOfBuilder) updates);
  UniEventsGetListRespBodyAllOfDataBuilder get data;
  set data(UniEventsGetListRespBodyAllOfDataBuilder? data);
}

class _$$UniEventsGetListRespBodyAllOf extends $UniEventsGetListRespBodyAllOf {
  @override
  final UniEventsGetListRespBodyAllOfData data;

  factory _$$UniEventsGetListRespBodyAllOf(
          [void Function($UniEventsGetListRespBodyAllOfBuilder)? updates]) =>
      (new $UniEventsGetListRespBodyAllOfBuilder()..update(updates))._build();

  _$$UniEventsGetListRespBodyAllOf._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        data, r'$UniEventsGetListRespBodyAllOf', 'data');
  }

  @override
  $UniEventsGetListRespBodyAllOf rebuild(
          void Function($UniEventsGetListRespBodyAllOfBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $UniEventsGetListRespBodyAllOfBuilder toBuilder() =>
      new $UniEventsGetListRespBodyAllOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $UniEventsGetListRespBodyAllOf && data == other.data;
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
    return (newBuiltValueToStringHelper(r'$UniEventsGetListRespBodyAllOf')
          ..add('data', data))
        .toString();
  }
}

class $UniEventsGetListRespBodyAllOfBuilder
    implements
        Builder<$UniEventsGetListRespBodyAllOf,
            $UniEventsGetListRespBodyAllOfBuilder>,
        UniEventsGetListRespBodyAllOfBuilder {
  _$$UniEventsGetListRespBodyAllOf? _$v;

  UniEventsGetListRespBodyAllOfDataBuilder? _data;
  UniEventsGetListRespBodyAllOfDataBuilder get data =>
      _$this._data ??= new UniEventsGetListRespBodyAllOfDataBuilder();
  set data(covariant UniEventsGetListRespBodyAllOfDataBuilder? data) =>
      _$this._data = data;

  $UniEventsGetListRespBodyAllOfBuilder() {
    $UniEventsGetListRespBodyAllOf._defaults(this);
  }

  $UniEventsGetListRespBodyAllOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant $UniEventsGetListRespBodyAllOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$$UniEventsGetListRespBodyAllOf;
  }

  @override
  void update(void Function($UniEventsGetListRespBodyAllOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $UniEventsGetListRespBodyAllOf build() => _build();

  _$$UniEventsGetListRespBodyAllOf _build() {
    _$$UniEventsGetListRespBodyAllOf _$result;
    try {
      _$result =
          _$v ?? new _$$UniEventsGetListRespBodyAllOf._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'$UniEventsGetListRespBodyAllOf', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
