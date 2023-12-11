// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_settings.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GlobalSettings extends GlobalSettings {
  @override
  final BuiltList<String>? inquireServiceAllowedTo;

  factory _$GlobalSettings([void Function(GlobalSettingsBuilder)? updates]) =>
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
  _$GlobalSettings? _$v;

  ListBuilder<String>? _inquireServiceAllowedTo;
  ListBuilder<String> get inquireServiceAllowedTo =>
      _$this._inquireServiceAllowedTo ??= new ListBuilder<String>();
  set inquireServiceAllowedTo(ListBuilder<String>? inquireServiceAllowedTo) =>
      _$this._inquireServiceAllowedTo = inquireServiceAllowedTo;

  GlobalSettingsBuilder() {
    GlobalSettings._defaults(this);
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
  void update(void Function(GlobalSettingsBuilder)? updates) {
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
      late String _$failedField;
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
