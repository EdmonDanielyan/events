// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'contacts_property_absence.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ContactsPropertyAbsence> _$contactsPropertyAbsenceSerializer =
    new _$ContactsPropertyAbsenceSerializer();

class _$ContactsPropertyAbsenceSerializer
    implements StructuredSerializer<ContactsPropertyAbsence> {
  @override
  final Iterable<Type> types = const [
    ContactsPropertyAbsence,
    _$ContactsPropertyAbsence
  ];
  @override
  final String wireName = 'ContactsPropertyAbsence';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ContactsPropertyAbsence object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.userId;
    if (value != null) {
      result
        ..add('user_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.reason;
    if (value != null) {
      result
        ..add('reason')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.from;
    if (value != null) {
      result
        ..add('from')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.to;
    if (value != null) {
      result
        ..add('to')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  ContactsPropertyAbsence deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContactsPropertyAbsenceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'user_id':
          result.userId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'reason':
          result.reason = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'from':
          result.from = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'to':
          result.to = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$ContactsPropertyAbsence extends ContactsPropertyAbsence {
  @override
  final int userId;
  @override
  final String reason;
  @override
  final String type;
  @override
  final DateTime from;
  @override
  final DateTime to;

  factory _$ContactsPropertyAbsence(
          [void Function(ContactsPropertyAbsenceBuilder) updates]) =>
      (new ContactsPropertyAbsenceBuilder()..update(updates))._build();

  _$ContactsPropertyAbsence._(
      {this.userId, this.reason, this.type, this.from, this.to})
      : super._();

  @override
  ContactsPropertyAbsence rebuild(
          void Function(ContactsPropertyAbsenceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactsPropertyAbsenceBuilder toBuilder() =>
      new ContactsPropertyAbsenceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactsPropertyAbsence &&
        userId == other.userId &&
        reason == other.reason &&
        type == other.type &&
        from == other.from &&
        to == other.to;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, from.hashCode);
    _$hash = $jc(_$hash, to.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ContactsPropertyAbsence')
          ..add('userId', userId)
          ..add('reason', reason)
          ..add('type', type)
          ..add('from', from)
          ..add('to', to))
        .toString();
  }
}

class ContactsPropertyAbsenceBuilder
    implements
        Builder<ContactsPropertyAbsence, ContactsPropertyAbsenceBuilder> {
  _$ContactsPropertyAbsence _$v;

  int _userId;
  int get userId => _$this._userId;
  set userId(int userId) => _$this._userId = userId;

  String _reason;
  String get reason => _$this._reason;
  set reason(String reason) => _$this._reason = reason;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  DateTime _from;
  DateTime get from => _$this._from;
  set from(DateTime from) => _$this._from = from;

  DateTime _to;
  DateTime get to => _$this._to;
  set to(DateTime to) => _$this._to = to;

  ContactsPropertyAbsenceBuilder() {
    ContactsPropertyAbsence._initializeBuilder(this);
  }

  ContactsPropertyAbsenceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _reason = $v.reason;
      _type = $v.type;
      _from = $v.from;
      _to = $v.to;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContactsPropertyAbsence other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ContactsPropertyAbsence;
  }

  @override
  void update(void Function(ContactsPropertyAbsenceBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ContactsPropertyAbsence build() => _build();

  _$ContactsPropertyAbsence _build() {
    final _$result = _$v ??
        new _$ContactsPropertyAbsence._(
            userId: userId, reason: reason, type: type, from: from, to: to);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
