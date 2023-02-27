// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'global_settings.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GlobalSettings> _$globalSettingsSerializer =
    new _$GlobalSettingsSerializer();

class _$GlobalSettingsSerializer
    implements StructuredSerializer<GlobalSettings> {
  @override
  final Iterable<Type> types = const [GlobalSettings, _$GlobalSettings];
  @override
  final String wireName = 'GlobalSettings';

  @override
  Iterable<Object> serialize(Serializers serializers, GlobalSettings object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.inquireServiceAllowedTo;
    if (value != null) {
      result
        ..add('inquire_service_allowed_to')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  GlobalSettings deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new GlobalSettingsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'inquire_service_allowed_to':
          result.inquireServiceAllowedTo.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$GlobalSettings extends GlobalSettings {
  @override
  final BuiltList<String> inquireServiceAllowedTo;

  factory _$GlobalSettings([void Function(GlobalSettingsBuilder) updates]) =>
      (new GlobalSettingsBuilder()..update(updates))._build();

  _$GlobalSettings._({this.inquireServiceAllowedTo}) : super._();

  @override
  GlobalSettings rebuild(void Function(GlobalSettingsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GlobalSettingsBuilder toBuilder() =>
      new GlobalSettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GlobalSettings &&
        inquireServiceAllowedTo == other.inquireServiceAllowedTo;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, inquireServiceAllowedTo.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GlobalSettings')
          ..add('inquireServiceAllowedTo', inquireServiceAllowedTo))
        .toString();
  }
}

class GlobalSettingsBuilder
    implements Builder<GlobalSettings, GlobalSettingsBuilder> {
  _$GlobalSettings _$v;

  ListBuilder<String> _inquireServiceAllowedTo;
  ListBuilder<String> get inquireServiceAllowedTo =>
      _$this._inquireServiceAllowedTo ??= new ListBuilder<String>();
  set inquireServiceAllowedTo(ListBuilder<String> inquireServiceAllowedTo) =>
      _$this._inquireServiceAllowedTo = inquireServiceAllowedTo;

  GlobalSettingsBuilder() {
    GlobalSettings._initializeBuilder(this);
  }

  GlobalSettingsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _inquireServiceAllowedTo = $v.inquireServiceAllowedTo?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GlobalSettings other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GlobalSettings;
  }

  @override
  void update(void Function(GlobalSettingsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  GlobalSettings build() => _build();

  _$GlobalSettings _build() {
    _$GlobalSettings _$result;
    try {
      _$result = _$v ??
          new _$GlobalSettings._(
              inquireServiceAllowedTo: _inquireServiceAllowedTo?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'inquireServiceAllowedTo';
        _inquireServiceAllowedTo?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GlobalSettings', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
