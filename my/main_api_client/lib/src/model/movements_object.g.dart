// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movements_object.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MovementsObject extends MovementsObject {
  @override
  final String? period;
  @override
  final String? position;
  @override
  final String? department;
  @override
  final String? organization;
  @override
  final String? operation;
  @override
  final String? pnum;

  factory _$MovementsObject([void Function(MovementsObjectBuilder)? updates]) =>
      (new MovementsObjectBuilder()..update(updates))._build();

  _$MovementsObject._(
      {this.period,
      this.position,
      this.department,
      this.organization,
      this.operation,
      this.pnum})
      : super._();

  @override
  MovementsObject rebuild(void Function(MovementsObjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MovementsObjectBuilder toBuilder() =>
      new MovementsObjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MovementsObject &&
        period == other.period &&
        position == other.position &&
        department == other.department &&
        organization == other.organization &&
        operation == other.operation &&
        pnum == other.pnum;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, period.hashCode);
    _$hash = $jc(_$hash, position.hashCode);
    _$hash = $jc(_$hash, department.hashCode);
    _$hash = $jc(_$hash, organization.hashCode);
    _$hash = $jc(_$hash, operation.hashCode);
    _$hash = $jc(_$hash, pnum.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MovementsObject')
          ..add('period', period)
          ..add('position', position)
          ..add('department', department)
          ..add('organization', organization)
          ..add('operation', operation)
          ..add('pnum', pnum))
        .toString();
  }
}

class MovementsObjectBuilder
    implements Builder<MovementsObject, MovementsObjectBuilder> {
  _$MovementsObject? _$v;

  String? _period;
  String? get period => _$this._period;
  set period(String? period) => _$this._period = period;

  String? _position;
  String? get position => _$this._position;
  set position(String? position) => _$this._position = position;

  String? _department;
  String? get department => _$this._department;
  set department(String? department) => _$this._department = department;

  String? _organization;
  String? get organization => _$this._organization;
  set organization(String? organization) => _$this._organization = organization;

  String? _operation;
  String? get operation => _$this._operation;
  set operation(String? operation) => _$this._operation = operation;

  String? _pnum;
  String? get pnum => _$this._pnum;
  set pnum(String? pnum) => _$this._pnum = pnum;

  MovementsObjectBuilder() {
    MovementsObject._defaults(this);
  }

  MovementsObjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _period = $v.period;
      _position = $v.position;
      _department = $v.department;
      _organization = $v.organization;
      _operation = $v.operation;
      _pnum = $v.pnum;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MovementsObject other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MovementsObject;
  }

  @override
  void update(void Function(MovementsObjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MovementsObject build() => _build();

  _$MovementsObject _build() {
    final _$result = _$v ??
        new _$MovementsObject._(
            period: period,
            position: position,
            department: department,
            organization: organization,
            operation: operation,
            pnum: pnum);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
