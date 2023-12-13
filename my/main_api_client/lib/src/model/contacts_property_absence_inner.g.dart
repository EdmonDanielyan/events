// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_property_absence_inner.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ContactsPropertyAbsenceInner extends ContactsPropertyAbsenceInner {
  @override
  final int? userId;
  @override
  final String? reason;
  @override
  final String? type;
  @override
  final DateTime? from;
  @override
  final DateTime? to;

  factory _$ContactsPropertyAbsenceInner(
          [void Function(ContactsPropertyAbsenceInnerBuilder)? updates]) =>
      (new ContactsPropertyAbsenceInnerBuilder()..update(updates))._build();

  _$ContactsPropertyAbsenceInner._(
      {this.userId, this.reason, this.type, this.from, this.to})
      : super._();

  @override
  ContactsPropertyAbsenceInner rebuild(
          void Function(ContactsPropertyAbsenceInnerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContactsPropertyAbsenceInnerBuilder toBuilder() =>
      new ContactsPropertyAbsenceInnerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContactsPropertyAbsenceInner &&
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
    return (newBuiltValueToStringHelper(r'ContactsPropertyAbsenceInner')
          ..add('userId', userId)
          ..add('reason', reason)
          ..add('type', type)
          ..add('from', from)
          ..add('to', to))
        .toString();
  }
}

class ContactsPropertyAbsenceInnerBuilder
    implements
        Builder<ContactsPropertyAbsenceInner,
            ContactsPropertyAbsenceInnerBuilder> {
  _$ContactsPropertyAbsenceInner? _$v;

  int? _userId;
  int? get userId => _$this._userId;
  set userId(int? userId) => _$this._userId = userId;

  String? _reason;
  String? get reason => _$this._reason;
  set reason(String? reason) => _$this._reason = reason;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  DateTime? _from;
  DateTime? get from => _$this._from;
  set from(DateTime? from) => _$this._from = from;

  DateTime? _to;
  DateTime? get to => _$this._to;
  set to(DateTime? to) => _$this._to = to;

  ContactsPropertyAbsenceInnerBuilder() {
    ContactsPropertyAbsenceInner._defaults(this);
  }

  ContactsPropertyAbsenceInnerBuilder get _$this {
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
  void replace(ContactsPropertyAbsenceInner other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ContactsPropertyAbsenceInner;
  }

  @override
  void update(void Function(ContactsPropertyAbsenceInnerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ContactsPropertyAbsenceInner build() => _build();

  _$ContactsPropertyAbsenceInner _build() {
    final _$result = _$v ??
        new _$ContactsPropertyAbsenceInner._(
            userId: userId, reason: reason, type: type, from: from, to: to);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
