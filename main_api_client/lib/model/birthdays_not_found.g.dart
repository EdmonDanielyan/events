// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'birthdays_not_found.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BirthdaysNotFound> _$birthdaysNotFoundSerializer =
    new _$BirthdaysNotFoundSerializer();

class _$BirthdaysNotFoundSerializer
    implements StructuredSerializer<BirthdaysNotFound> {
  @override
  final Iterable<Type> types = const [BirthdaysNotFound, _$BirthdaysNotFound];
  @override
  final String wireName = 'BirthdaysNotFound';

  @override
  Iterable<Object> serialize(Serializers serializers, BirthdaysNotFound object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.detail;
    if (value != null) {
      result
        ..add('detail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.code;
    if (value != null) {
      result
        ..add('code')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.success;
    if (value != null) {
      result
        ..add('success')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.host;
    if (value != null) {
      result
        ..add('host')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.version;
    if (value != null) {
      result
        ..add('version')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.returned;
    if (value != null) {
      result
        ..add('returned')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.instance;
    if (value != null) {
      result
        ..add('instance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  BirthdaysNotFound deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BirthdaysNotFoundBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'detail':
          result.detail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'success':
          result.success = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'host':
          result.host = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'version':
          result.version = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'returned':
          result.returned = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'instance':
          result.instance = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$BirthdaysNotFound extends BirthdaysNotFound {
  @override
  final String title;
  @override
  final String detail;
  @override
  final int status;
  @override
  final String code;
  @override
  final bool success;
  @override
  final String host;
  @override
  final String version;
  @override
  final DateTime returned;
  @override
  final String type;
  @override
  final String instance;

  factory _$BirthdaysNotFound(
          [void Function(BirthdaysNotFoundBuilder) updates]) =>
      (new BirthdaysNotFoundBuilder()..update(updates))._build();

  _$BirthdaysNotFound._(
      {this.title,
      this.detail,
      this.status,
      this.code,
      this.success,
      this.host,
      this.version,
      this.returned,
      this.type,
      this.instance})
      : super._();

  @override
  BirthdaysNotFound rebuild(void Function(BirthdaysNotFoundBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BirthdaysNotFoundBuilder toBuilder() =>
      new BirthdaysNotFoundBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BirthdaysNotFound &&
        title == other.title &&
        detail == other.detail &&
        status == other.status &&
        code == other.code &&
        success == other.success &&
        host == other.host &&
        version == other.version &&
        returned == other.returned &&
        type == other.type &&
        instance == other.instance;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, title.hashCode),
                                        detail.hashCode),
                                    status.hashCode),
                                code.hashCode),
                            success.hashCode),
                        host.hashCode),
                    version.hashCode),
                returned.hashCode),
            type.hashCode),
        instance.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BirthdaysNotFound')
          ..add('title', title)
          ..add('detail', detail)
          ..add('status', status)
          ..add('code', code)
          ..add('success', success)
          ..add('host', host)
          ..add('version', version)
          ..add('returned', returned)
          ..add('type', type)
          ..add('instance', instance))
        .toString();
  }
}

class BirthdaysNotFoundBuilder
    implements Builder<BirthdaysNotFound, BirthdaysNotFoundBuilder> {
  _$BirthdaysNotFound _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _detail;
  String get detail => _$this._detail;
  set detail(String detail) => _$this._detail = detail;

  int _status;
  int get status => _$this._status;
  set status(int status) => _$this._status = status;

  String _code;
  String get code => _$this._code;
  set code(String code) => _$this._code = code;

  bool _success;
  bool get success => _$this._success;
  set success(bool success) => _$this._success = success;

  String _host;
  String get host => _$this._host;
  set host(String host) => _$this._host = host;

  String _version;
  String get version => _$this._version;
  set version(String version) => _$this._version = version;

  DateTime _returned;
  DateTime get returned => _$this._returned;
  set returned(DateTime returned) => _$this._returned = returned;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  String _instance;
  String get instance => _$this._instance;
  set instance(String instance) => _$this._instance = instance;

  BirthdaysNotFoundBuilder() {
    BirthdaysNotFound._initializeBuilder(this);
  }

  BirthdaysNotFoundBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _detail = $v.detail;
      _status = $v.status;
      _code = $v.code;
      _success = $v.success;
      _host = $v.host;
      _version = $v.version;
      _returned = $v.returned;
      _type = $v.type;
      _instance = $v.instance;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BirthdaysNotFound other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BirthdaysNotFound;
  }

  @override
  void update(void Function(BirthdaysNotFoundBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  BirthdaysNotFound build() => _build();

  _$BirthdaysNotFound _build() {
    final _$result = _$v ??
        new _$BirthdaysNotFound._(
            title: title,
            detail: detail,
            status: status,
            code: code,
            success: success,
            host: host,
            version: version,
            returned: returned,
            type: type,
            instance: instance);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
