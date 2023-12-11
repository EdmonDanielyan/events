// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uni_sub_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const UniSubRequestVersionEnum _$uniSubRequestVersionEnum_number1 =
    const UniSubRequestVersionEnum._('number1');

UniSubRequestVersionEnum _$uniSubRequestVersionEnumValueOf(String name) {
  switch (name) {
    case 'number1':
      return _$uniSubRequestVersionEnum_number1;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<UniSubRequestVersionEnum> _$uniSubRequestVersionEnumValues =
    new BuiltSet<UniSubRequestVersionEnum>(const <UniSubRequestVersionEnum>[
  _$uniSubRequestVersionEnum_number1,
]);

Serializer<UniSubRequestVersionEnum> _$uniSubRequestVersionEnumSerializer =
    new _$UniSubRequestVersionEnumSerializer();

class _$UniSubRequestVersionEnumSerializer
    implements PrimitiveSerializer<UniSubRequestVersionEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'number1': 1,
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    1: 'number1',
  };

  @override
  final Iterable<Type> types = const <Type>[UniSubRequestVersionEnum];
  @override
  final String wireName = 'UniSubRequestVersionEnum';

  @override
  Object serialize(Serializers serializers, UniSubRequestVersionEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  UniSubRequestVersionEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      UniSubRequestVersionEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$UniSubRequest extends UniSubRequest {
  @override
  final UniSubRequestVersionEnum? version;
  @override
  final BuiltList<UniSubRequestField>? fields;
  @override
  final BuiltList<UniSubRequestOption>? options;
  @override
  final BuiltList<UniSubRequestVisitor>? children;
  @override
  final BuiltList<UniSubRequestVisitor>? visitors;

  factory _$UniSubRequest([void Function(UniSubRequestBuilder)? updates]) =>
      (new UniSubRequestBuilder()..update(updates))._build();

  _$UniSubRequest._(
      {this.version, this.fields, this.options, this.children, this.visitors})
      : super._();

  @override
  UniSubRequest rebuild(void Function(UniSubRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UniSubRequestBuilder toBuilder() => new UniSubRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UniSubRequest &&
        version == other.version &&
        fields == other.fields &&
        options == other.options &&
        children == other.children &&
        visitors == other.visitors;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, version.hashCode);
    _$hash = $jc(_$hash, fields.hashCode);
    _$hash = $jc(_$hash, options.hashCode);
    _$hash = $jc(_$hash, children.hashCode);
    _$hash = $jc(_$hash, visitors.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UniSubRequest')
          ..add('version', version)
          ..add('fields', fields)
          ..add('options', options)
          ..add('children', children)
          ..add('visitors', visitors))
        .toString();
  }
}

class UniSubRequestBuilder
    implements Builder<UniSubRequest, UniSubRequestBuilder> {
  _$UniSubRequest? _$v;

  UniSubRequestVersionEnum? _version;
  UniSubRequestVersionEnum? get version => _$this._version;
  set version(UniSubRequestVersionEnum? version) => _$this._version = version;

  ListBuilder<UniSubRequestField>? _fields;
  ListBuilder<UniSubRequestField> get fields =>
      _$this._fields ??= new ListBuilder<UniSubRequestField>();
  set fields(ListBuilder<UniSubRequestField>? fields) =>
      _$this._fields = fields;

  ListBuilder<UniSubRequestOption>? _options;
  ListBuilder<UniSubRequestOption> get options =>
      _$this._options ??= new ListBuilder<UniSubRequestOption>();
  set options(ListBuilder<UniSubRequestOption>? options) =>
      _$this._options = options;

  ListBuilder<UniSubRequestVisitor>? _children;
  ListBuilder<UniSubRequestVisitor> get children =>
      _$this._children ??= new ListBuilder<UniSubRequestVisitor>();
  set children(ListBuilder<UniSubRequestVisitor>? children) =>
      _$this._children = children;

  ListBuilder<UniSubRequestVisitor>? _visitors;
  ListBuilder<UniSubRequestVisitor> get visitors =>
      _$this._visitors ??= new ListBuilder<UniSubRequestVisitor>();
  set visitors(ListBuilder<UniSubRequestVisitor>? visitors) =>
      _$this._visitors = visitors;

  UniSubRequestBuilder() {
    UniSubRequest._defaults(this);
  }

  UniSubRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _version = $v.version;
      _fields = $v.fields?.toBuilder();
      _options = $v.options?.toBuilder();
      _children = $v.children?.toBuilder();
      _visitors = $v.visitors?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UniSubRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UniSubRequest;
  }

  @override
  void update(void Function(UniSubRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UniSubRequest build() => _build();

  _$UniSubRequest _build() {
    _$UniSubRequest _$result;
    try {
      _$result = _$v ??
          new _$UniSubRequest._(
              version: version,
              fields: _fields?.build(),
              options: _options?.build(),
              children: _children?.build(),
              visitors: _visitors?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'fields';
        _fields?.build();
        _$failedField = 'options';
        _options?.build();
        _$failedField = 'children';
        _children?.build();
        _$failedField = 'visitors';
        _visitors?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UniSubRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
