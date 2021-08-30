// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'birthdays_success_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BirthdaysSuccessData> _$birthdaysSuccessDataSerializer =
    new _$BirthdaysSuccessDataSerializer();

class _$BirthdaysSuccessDataSerializer
    implements StructuredSerializer<BirthdaysSuccessData> {
  @override
  final Iterable<Type> types = const [
    BirthdaysSuccessData,
    _$BirthdaysSuccessData
  ];
  @override
  final String wireName = 'BirthdaysSuccessData';

  @override
  Iterable<Object> serialize(
      Serializers serializers, BirthdaysSuccessData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.others;
    if (value != null) {
      result
        ..add('others')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(UserProperties)])));
    }
    value = object.today;
    if (value != null) {
      result
        ..add('today')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(UserProperties)])));
    }
    return result;
  }

  @override
  BirthdaysSuccessData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BirthdaysSuccessDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'others':
          result.others.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(UserProperties)]))
              as BuiltList<Object>);
          break;
        case 'today':
          result.today.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(UserProperties)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$BirthdaysSuccessData extends BirthdaysSuccessData {
  @override
  final BuiltList<UserProperties> others;
  @override
  final BuiltList<UserProperties> today;

  factory _$BirthdaysSuccessData(
          [void Function(BirthdaysSuccessDataBuilder) updates]) =>
      (new BirthdaysSuccessDataBuilder()..update(updates)).build();

  _$BirthdaysSuccessData._({this.others, this.today}) : super._();

  @override
  BirthdaysSuccessData rebuild(
          void Function(BirthdaysSuccessDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BirthdaysSuccessDataBuilder toBuilder() =>
      new BirthdaysSuccessDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BirthdaysSuccessData &&
        others == other.others &&
        today == other.today;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, others.hashCode), today.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BirthdaysSuccessData')
          ..add('others', others)
          ..add('today', today))
        .toString();
  }
}

class BirthdaysSuccessDataBuilder
    implements Builder<BirthdaysSuccessData, BirthdaysSuccessDataBuilder> {
  _$BirthdaysSuccessData _$v;

  ListBuilder<UserProperties> _others;
  ListBuilder<UserProperties> get others =>
      _$this._others ??= new ListBuilder<UserProperties>();
  set others(ListBuilder<UserProperties> others) => _$this._others = others;

  ListBuilder<UserProperties> _today;
  ListBuilder<UserProperties> get today =>
      _$this._today ??= new ListBuilder<UserProperties>();
  set today(ListBuilder<UserProperties> today) => _$this._today = today;

  BirthdaysSuccessDataBuilder() {
    BirthdaysSuccessData._initializeBuilder(this);
  }

  BirthdaysSuccessDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _others = $v.others?.toBuilder();
      _today = $v.today?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BirthdaysSuccessData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BirthdaysSuccessData;
  }

  @override
  void update(void Function(BirthdaysSuccessDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BirthdaysSuccessData build() {
    _$BirthdaysSuccessData _$result;
    try {
      _$result = _$v ??
          new _$BirthdaysSuccessData._(
              others: _others?.build(), today: _today?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'others';
        _others?.build();
        _$failedField = 'today';
        _today?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'BirthdaysSuccessData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
