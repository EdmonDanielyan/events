// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_section_success_response_body_all_of.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class ListSectionSuccessResponseBodyAllOfBuilder {
  void replace(ListSectionSuccessResponseBodyAllOf other);
  void update(
      void Function(ListSectionSuccessResponseBodyAllOfBuilder) updates);
  ListSectionResponseDataBuilder get data;
  set data(ListSectionResponseDataBuilder? data);
}

class _$$ListSectionSuccessResponseBodyAllOf
    extends $ListSectionSuccessResponseBodyAllOf {
  @override
  final ListSectionResponseData? data;

  factory _$$ListSectionSuccessResponseBodyAllOf(
          [void Function($ListSectionSuccessResponseBodyAllOfBuilder)?
              updates]) =>
      (new $ListSectionSuccessResponseBodyAllOfBuilder()..update(updates))
          ._build();

  _$$ListSectionSuccessResponseBodyAllOf._({this.data}) : super._();

  @override
  $ListSectionSuccessResponseBodyAllOf rebuild(
          void Function($ListSectionSuccessResponseBodyAllOfBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $ListSectionSuccessResponseBodyAllOfBuilder toBuilder() =>
      new $ListSectionSuccessResponseBodyAllOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $ListSectionSuccessResponseBodyAllOf && data == other.data;
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
    return (newBuiltValueToStringHelper(r'$ListSectionSuccessResponseBodyAllOf')
          ..add('data', data))
        .toString();
  }
}

class $ListSectionSuccessResponseBodyAllOfBuilder
    implements
        Builder<$ListSectionSuccessResponseBodyAllOf,
            $ListSectionSuccessResponseBodyAllOfBuilder>,
        ListSectionSuccessResponseBodyAllOfBuilder {
  _$$ListSectionSuccessResponseBodyAllOf? _$v;

  ListSectionResponseDataBuilder? _data;
  ListSectionResponseDataBuilder get data =>
      _$this._data ??= new ListSectionResponseDataBuilder();
  set data(covariant ListSectionResponseDataBuilder? data) =>
      _$this._data = data;

  $ListSectionSuccessResponseBodyAllOfBuilder() {
    $ListSectionSuccessResponseBodyAllOf._defaults(this);
  }

  $ListSectionSuccessResponseBodyAllOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant $ListSectionSuccessResponseBodyAllOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$$ListSectionSuccessResponseBodyAllOf;
  }

  @override
  void update(
      void Function($ListSectionSuccessResponseBodyAllOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $ListSectionSuccessResponseBodyAllOf build() => _build();

  _$$ListSectionSuccessResponseBodyAllOf _build() {
    _$$ListSectionSuccessResponseBodyAllOf _$result;
    try {
      _$result = _$v ??
          new _$$ListSectionSuccessResponseBodyAllOf._(data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'$ListSectionSuccessResponseBodyAllOf',
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
