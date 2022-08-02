// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'movements_object.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MovementsObject> _$movementsObjectSerializer =
    new _$MovementsObjectSerializer();

class _$MovementsObjectSerializer
    implements StructuredSerializer<MovementsObject> {
  @override
  final Iterable<Type> types = const [MovementsObject, _$MovementsObject];
  @override
  final String wireName = 'MovementsObject';

  @override
  Iterable<Object> serialize(Serializers serializers, MovementsObject object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.period;
    if (value != null) {
      result
        ..add('period')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.position;
    if (value != null) {
      result
        ..add('position')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.department;
    if (value != null) {
      result
        ..add('department')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.organization;
    if (value != null) {
      result
        ..add('organization')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.operation;
    if (value != null) {
      result
        ..add('operation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pnum;
    if (value != null) {
      result
        ..add('pnum')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  MovementsObject deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MovementsObjectBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'period':
          result.period = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'position':
          result.position = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'department':
          result.department = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'organization':
          result.organization = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'operation':
          result.operation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pnum':
          result.pnum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$MovementsObject extends MovementsObject {
  @override
  final String period;
  @override
  final String position;
  @override
  final String department;
  @override
  final String organization;
  @override
  final String operation;
  @override
  final String pnum;

  factory _$MovementsObject([void Function(MovementsObjectBuilder) updates]) =>
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
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, period.hashCode), position.hashCode),
                    department.hashCode),
                organization.hashCode),
            operation.hashCode),
        pnum.hashCode));
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
  _$MovementsObject _$v;

  String _period;
  String get period => _$this._period;
  set period(String period) => _$this._period = period;

  String _position;
  String get position => _$this._position;
  set position(String position) => _$this._position = position;

  String _department;
  String get department => _$this._department;
  set department(String department) => _$this._department = department;

  String _organization;
  String get organization => _$this._organization;
  set organization(String organization) => _$this._organization = organization;

  String _operation;
  String get operation => _$this._operation;
  set operation(String operation) => _$this._operation = operation;

  String _pnum;
  String get pnum => _$this._pnum;
  set pnum(String pnum) => _$this._pnum = pnum;

  MovementsObjectBuilder() {
    MovementsObject._initializeBuilder(this);
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
  void update(void Function(MovementsObjectBuilder) updates) {
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

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
