// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organisation_directory_response_body_all_of.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class OrganisationDirectoryResponseBodyAllOfBuilder {
  void replace(OrganisationDirectoryResponseBodyAllOf other);
  void update(
      void Function(OrganisationDirectoryResponseBodyAllOfBuilder) updates);
  OrganisationDirectoryBuilder get data;
  set data(OrganisationDirectoryBuilder? data);
}

class _$$OrganisationDirectoryResponseBodyAllOf
    extends $OrganisationDirectoryResponseBodyAllOf {
  @override
  final OrganisationDirectory? data;

  factory _$$OrganisationDirectoryResponseBodyAllOf(
          [void Function($OrganisationDirectoryResponseBodyAllOfBuilder)?
              updates]) =>
      (new $OrganisationDirectoryResponseBodyAllOfBuilder()..update(updates))
          ._build();

  _$$OrganisationDirectoryResponseBodyAllOf._({this.data}) : super._();

  @override
  $OrganisationDirectoryResponseBodyAllOf rebuild(
          void Function($OrganisationDirectoryResponseBodyAllOfBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $OrganisationDirectoryResponseBodyAllOfBuilder toBuilder() =>
      new $OrganisationDirectoryResponseBodyAllOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $OrganisationDirectoryResponseBodyAllOf &&
        data == other.data;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'$OrganisationDirectoryResponseBodyAllOf')
          ..add('data', data))
        .toString();
  }
}

class $OrganisationDirectoryResponseBodyAllOfBuilder
    implements
        Builder<$OrganisationDirectoryResponseBodyAllOf,
            $OrganisationDirectoryResponseBodyAllOfBuilder>,
        OrganisationDirectoryResponseBodyAllOfBuilder {
  _$$OrganisationDirectoryResponseBodyAllOf? _$v;

  OrganisationDirectoryBuilder? _data;
  OrganisationDirectoryBuilder get data =>
      _$this._data ??= new OrganisationDirectoryBuilder();
  set data(covariant OrganisationDirectoryBuilder? data) => _$this._data = data;

  $OrganisationDirectoryResponseBodyAllOfBuilder() {
    $OrganisationDirectoryResponseBodyAllOf._defaults(this);
  }

  $OrganisationDirectoryResponseBodyAllOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant $OrganisationDirectoryResponseBodyAllOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$$OrganisationDirectoryResponseBodyAllOf;
  }

  @override
  void update(
      void Function($OrganisationDirectoryResponseBodyAllOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $OrganisationDirectoryResponseBodyAllOf build() => _build();

  _$$OrganisationDirectoryResponseBodyAllOf _build() {
    _$$OrganisationDirectoryResponseBodyAllOf _$result;
    try {
      _$result = _$v ??
          new _$$OrganisationDirectoryResponseBodyAllOf._(data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'$OrganisationDirectoryResponseBodyAllOf',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
