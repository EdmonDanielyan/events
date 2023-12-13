// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_field.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SubscriptionFieldTypeEnum _$subscriptionFieldTypeEnum_string =
    const SubscriptionFieldTypeEnum._('string');
const SubscriptionFieldTypeEnum _$subscriptionFieldTypeEnum_dictionary =
    const SubscriptionFieldTypeEnum._('dictionary');
const SubscriptionFieldTypeEnum _$subscriptionFieldTypeEnum_int_ =
    const SubscriptionFieldTypeEnum._('int_');
const SubscriptionFieldTypeEnum _$subscriptionFieldTypeEnum_date =
    const SubscriptionFieldTypeEnum._('date');

SubscriptionFieldTypeEnum _$subscriptionFieldTypeEnumValueOf(String name) {
  switch (name) {
    case 'string':
      return _$subscriptionFieldTypeEnum_string;
    case 'dictionary':
      return _$subscriptionFieldTypeEnum_dictionary;
    case 'int_':
      return _$subscriptionFieldTypeEnum_int_;
    case 'date':
      return _$subscriptionFieldTypeEnum_date;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<SubscriptionFieldTypeEnum> _$subscriptionFieldTypeEnumValues =
    new BuiltSet<SubscriptionFieldTypeEnum>(const <SubscriptionFieldTypeEnum>[
  _$subscriptionFieldTypeEnum_string,
  _$subscriptionFieldTypeEnum_dictionary,
  _$subscriptionFieldTypeEnum_int_,
  _$subscriptionFieldTypeEnum_date,
]);

Serializer<SubscriptionFieldTypeEnum> _$subscriptionFieldTypeEnumSerializer =
    new _$SubscriptionFieldTypeEnumSerializer();

class _$SubscriptionFieldTypeEnumSerializer
    implements PrimitiveSerializer<SubscriptionFieldTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'string': 'string',
    'dictionary': 'dictionary',
    'int_': 'int',
    'date': 'date',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'string': 'string',
    'dictionary': 'dictionary',
    'int': 'int_',
    'date': 'date',
  };

  @override
  final Iterable<Type> types = const <Type>[SubscriptionFieldTypeEnum];
  @override
  final String wireName = 'SubscriptionFieldTypeEnum';

  @override
  Object serialize(Serializers serializers, SubscriptionFieldTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SubscriptionFieldTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SubscriptionFieldTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$SubscriptionField extends SubscriptionField {
  @override
  final String? title;
  @override
  final String? code;
  @override
  final SubscriptionFieldTypeEnum? type;
  @override
  final bool? req;
  @override
  final JsonObject? params;

  factory _$SubscriptionField(
          [void Function(SubscriptionFieldBuilder)? updates]) =>
      (new SubscriptionFieldBuilder()..update(updates))._build();

  _$SubscriptionField._(
      {this.title, this.code, this.type, this.req, this.params})
      : super._();

  @override
  SubscriptionField rebuild(void Function(SubscriptionFieldBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscriptionFieldBuilder toBuilder() =>
      new SubscriptionFieldBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubscriptionField &&
        title == other.title &&
        code == other.code &&
        type == other.type &&
        req == other.req &&
        params == other.params;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, req.hashCode);
    _$hash = $jc(_$hash, params.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SubscriptionField')
          ..add('title', title)
          ..add('code', code)
          ..add('type', type)
          ..add('req', req)
          ..add('params', params))
        .toString();
  }
}

class SubscriptionFieldBuilder
    implements Builder<SubscriptionField, SubscriptionFieldBuilder> {
  _$SubscriptionField? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  SubscriptionFieldTypeEnum? _type;
  SubscriptionFieldTypeEnum? get type => _$this._type;
  set type(SubscriptionFieldTypeEnum? type) => _$this._type = type;

  bool? _req;
  bool? get req => _$this._req;
  set req(bool? req) => _$this._req = req;

  JsonObject? _params;
  JsonObject? get params => _$this._params;
  set params(JsonObject? params) => _$this._params = params;

  SubscriptionFieldBuilder() {
    SubscriptionField._defaults(this);
  }

  SubscriptionFieldBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _code = $v.code;
      _type = $v.type;
      _req = $v.req;
      _params = $v.params;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubscriptionField other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubscriptionField;
  }

  @override
  void update(void Function(SubscriptionFieldBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubscriptionField build() => _build();

  _$SubscriptionField _build() {
    final _$result = _$v ??
        new _$SubscriptionField._(
            title: title, code: code, type: type, req: req, params: params);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
