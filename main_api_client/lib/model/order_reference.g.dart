// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'order_reference.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrderReference> _$orderReferenceSerializer =
    new _$OrderReferenceSerializer();

class _$OrderReferenceSerializer
    implements StructuredSerializer<OrderReference> {
  @override
  final Iterable<Type> types = const [OrderReference, _$OrderReference];
  @override
  final String wireName = 'OrderReference';

  @override
  Iterable<Object> serialize(Serializers serializers, OrderReference object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.referenceType;
    if (value != null) {
      result
        ..add('reference_type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phone;
    if (value != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.way;
    if (value != null) {
      result
        ..add('way')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.postalCode;
    if (value != null) {
      result
        ..add('postal_code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.period;
    if (value != null) {
      result
        ..add('period')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.destination;
    if (value != null) {
      result
        ..add('destination')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.num_;
    if (value != null) {
      result
        ..add('num')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.child;
    if (value != null) {
      result
        ..add('child')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateStart;
    if (value != null) {
      result
        ..add('date_start')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dateEnd;
    if (value != null) {
      result
        ..add('date_end')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  OrderReference deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrderReferenceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'reference_type':
          result.referenceType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'way':
          result.way = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'postal_code':
          result.postalCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'period':
          result.period = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'destination':
          result.destination = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'num':
          result.num_ = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'child':
          result.child = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date_start':
          result.dateStart = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date_end':
          result.dateEnd = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$OrderReference extends OrderReference {
  @override
  final String referenceType;
  @override
  final String phone;
  @override
  final String way;
  @override
  final String postalCode;
  @override
  final String address;
  @override
  final String period;
  @override
  final String destination;
  @override
  final int num_;
  @override
  final String child;
  @override
  final String dateStart;
  @override
  final String dateEnd;

  factory _$OrderReference([void Function(OrderReferenceBuilder) updates]) =>
      (new OrderReferenceBuilder()..update(updates))._build();

  _$OrderReference._(
      {this.referenceType,
      this.phone,
      this.way,
      this.postalCode,
      this.address,
      this.period,
      this.destination,
      this.num_,
      this.child,
      this.dateStart,
      this.dateEnd})
      : super._();

  @override
  OrderReference rebuild(void Function(OrderReferenceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrderReferenceBuilder toBuilder() =>
      new OrderReferenceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderReference &&
        referenceType == other.referenceType &&
        phone == other.phone &&
        way == other.way &&
        postalCode == other.postalCode &&
        address == other.address &&
        period == other.period &&
        destination == other.destination &&
        num_ == other.num_ &&
        child == other.child &&
        dateStart == other.dateStart &&
        dateEnd == other.dateEnd;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, referenceType.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, way.hashCode);
    _$hash = $jc(_$hash, postalCode.hashCode);
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, period.hashCode);
    _$hash = $jc(_$hash, destination.hashCode);
    _$hash = $jc(_$hash, num_.hashCode);
    _$hash = $jc(_$hash, child.hashCode);
    _$hash = $jc(_$hash, dateStart.hashCode);
    _$hash = $jc(_$hash, dateEnd.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrderReference')
          ..add('referenceType', referenceType)
          ..add('phone', phone)
          ..add('way', way)
          ..add('postalCode', postalCode)
          ..add('address', address)
          ..add('period', period)
          ..add('destination', destination)
          ..add('num_', num_)
          ..add('child', child)
          ..add('dateStart', dateStart)
          ..add('dateEnd', dateEnd))
        .toString();
  }
}

class OrderReferenceBuilder
    implements Builder<OrderReference, OrderReferenceBuilder> {
  _$OrderReference _$v;

  String _referenceType;
  String get referenceType => _$this._referenceType;
  set referenceType(String referenceType) =>
      _$this._referenceType = referenceType;

  String _phone;
  String get phone => _$this._phone;
  set phone(String phone) => _$this._phone = phone;

  String _way;
  String get way => _$this._way;
  set way(String way) => _$this._way = way;

  String _postalCode;
  String get postalCode => _$this._postalCode;
  set postalCode(String postalCode) => _$this._postalCode = postalCode;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _period;
  String get period => _$this._period;
  set period(String period) => _$this._period = period;

  String _destination;
  String get destination => _$this._destination;
  set destination(String destination) => _$this._destination = destination;

  int _num_;
  int get num_ => _$this._num_;
  set num_(int num_) => _$this._num_ = num_;

  String _child;
  String get child => _$this._child;
  set child(String child) => _$this._child = child;

  String _dateStart;
  String get dateStart => _$this._dateStart;
  set dateStart(String dateStart) => _$this._dateStart = dateStart;

  String _dateEnd;
  String get dateEnd => _$this._dateEnd;
  set dateEnd(String dateEnd) => _$this._dateEnd = dateEnd;

  OrderReferenceBuilder() {
    OrderReference._initializeBuilder(this);
  }

  OrderReferenceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _referenceType = $v.referenceType;
      _phone = $v.phone;
      _way = $v.way;
      _postalCode = $v.postalCode;
      _address = $v.address;
      _period = $v.period;
      _destination = $v.destination;
      _num_ = $v.num_;
      _child = $v.child;
      _dateStart = $v.dateStart;
      _dateEnd = $v.dateEnd;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrderReference other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrderReference;
  }

  @override
  void update(void Function(OrderReferenceBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  OrderReference build() => _build();

  _$OrderReference _build() {
    final _$result = _$v ??
        new _$OrderReference._(
            referenceType: referenceType,
            phone: phone,
            way: way,
            postalCode: postalCode,
            address: address,
            period: period,
            destination: destination,
            num_: num_,
            child: child,
            dateStart: dateStart,
            dateEnd: dateEnd);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
