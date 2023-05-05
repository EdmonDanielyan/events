// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'all_notifications_config_result_body_all_of.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AllNotificationsConfigResultBodyAllOf>
    _$allNotificationsConfigResultBodyAllOfSerializer =
    new _$AllNotificationsConfigResultBodyAllOfSerializer();

class _$AllNotificationsConfigResultBodyAllOfSerializer
    implements StructuredSerializer<AllNotificationsConfigResultBodyAllOf> {
  @override
  final Iterable<Type> types = const [
    AllNotificationsConfigResultBodyAllOf,
    _$AllNotificationsConfigResultBodyAllOf
  ];
  @override
  final String wireName = 'AllNotificationsConfigResultBodyAllOf';

  @override
  Iterable<Object> serialize(
      Serializers serializers, AllNotificationsConfigResultBodyAllOf object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.data;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(NotificationFullList)));
    }
    return result;
  }

  @override
  AllNotificationsConfigResultBodyAllOf deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AllNotificationsConfigResultBodyAllOfBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
                  specifiedType: const FullType(NotificationFullList))
              as NotificationFullList);
          break;
      }
    }

    return result.build();
  }
}

class _$AllNotificationsConfigResultBodyAllOf
    extends AllNotificationsConfigResultBodyAllOf {
  @override
  final NotificationFullList data;

  factory _$AllNotificationsConfigResultBodyAllOf(
          [void Function(AllNotificationsConfigResultBodyAllOfBuilder)
              updates]) =>
      (new AllNotificationsConfigResultBodyAllOfBuilder()..update(updates))
          ._build();

  _$AllNotificationsConfigResultBodyAllOf._({this.data}) : super._();

  @override
  AllNotificationsConfigResultBodyAllOf rebuild(
          void Function(AllNotificationsConfigResultBodyAllOfBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AllNotificationsConfigResultBodyAllOfBuilder toBuilder() =>
      new AllNotificationsConfigResultBodyAllOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AllNotificationsConfigResultBodyAllOf && data == other.data;
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
            r'AllNotificationsConfigResultBodyAllOf')
          ..add('data', data))
        .toString();
  }
}

class AllNotificationsConfigResultBodyAllOfBuilder
    implements
        Builder<AllNotificationsConfigResultBodyAllOf,
            AllNotificationsConfigResultBodyAllOfBuilder> {
  _$AllNotificationsConfigResultBodyAllOf _$v;

  NotificationFullListBuilder _data;
  NotificationFullListBuilder get data =>
      _$this._data ??= new NotificationFullListBuilder();
  set data(NotificationFullListBuilder data) => _$this._data = data;

  AllNotificationsConfigResultBodyAllOfBuilder() {
    AllNotificationsConfigResultBodyAllOf._initializeBuilder(this);
  }

  AllNotificationsConfigResultBodyAllOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AllNotificationsConfigResultBodyAllOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AllNotificationsConfigResultBodyAllOf;
  }

  @override
  void update(
      void Function(AllNotificationsConfigResultBodyAllOfBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  AllNotificationsConfigResultBodyAllOf build() => _build();

  _$AllNotificationsConfigResultBodyAllOf _build() {
    _$AllNotificationsConfigResultBodyAllOf _$result;
    try {
      _$result = _$v ??
          new _$AllNotificationsConfigResultBodyAllOf._(data: _data?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AllNotificationsConfigResultBodyAllOf',
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
