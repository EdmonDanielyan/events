// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_section_success_response_body_all_of.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class SingleSectionSuccessResponseBodyAllOfBuilder {
  void replace(SingleSectionSuccessResponseBodyAllOf other);
  void update(
      void Function(SingleSectionSuccessResponseBodyAllOfBuilder) updates);
  SingleSectionResponseDataBuilder get data;
  set data(SingleSectionResponseDataBuilder? data);
}

class _$$SingleSectionSuccessResponseBodyAllOf
    extends $SingleSectionSuccessResponseBodyAllOf {
  @override
  final SingleSectionResponseData? data;

  factory _$$SingleSectionSuccessResponseBodyAllOf(
          [void Function($SingleSectionSuccessResponseBodyAllOfBuilder)?
              updates]) =>
      (new $SingleSectionSuccessResponseBodyAllOfBuilder()..update(updates))
          ._build();

  _$$SingleSectionSuccessResponseBodyAllOf._({this.data}) : super._();

  @override
  $SingleSectionSuccessResponseBodyAllOf rebuild(
          void Function($SingleSectionSuccessResponseBodyAllOfBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $SingleSectionSuccessResponseBodyAllOfBuilder toBuilder() =>
      new $SingleSectionSuccessResponseBodyAllOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $SingleSectionSuccessResponseBodyAllOf &&
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
            r'$SingleSectionSuccessResponseBodyAllOf')
          ..add('data', data))
        .toString();
  }
}

class $SingleSectionSuccessResponseBodyAllOfBuilder
    implements
        Builder<$SingleSectionSuccessResponseBodyAllOf,
            $SingleSectionSuccessResponseBodyAllOfBuilder>,
        SingleSectionSuccessResponseBodyAllOfBuilder {
  _$$SingleSectionSuccessResponseBodyAllOf? _$v;

  SingleSectionResponseDataBuilder? _data;
  SingleSectionResponseDataBuilder get data =>
      _$this._data ??= new SingleSectionResponseDataBuilder();
  set data(covariant SingleSectionResponseDataBuilder? data) =>
      _$this._data = data;

  $SingleSectionSuccessResponseBodyAllOfBuilder() {
    $SingleSectionSuccessResponseBodyAllOf._defaults(this);
  }

  $SingleSectionSuccessResponseBodyAllOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant $SingleSectionSuccessResponseBodyAllOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$$SingleSectionSuccessResponseBodyAllOf;
  }

  @override
  void update(
      void Function($SingleSectionSuccessResponseBodyAllOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $SingleSectionSuccessResponseBodyAllOf build() => _build();

  _$$SingleSectionSuccessResponseBodyAllOf _build() {
    _$$SingleSectionSuccessResponseBodyAllOf _$result;
    try {
      _$result = _$v ??
          new _$$SingleSectionSuccessResponseBodyAllOf._(data: _data?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        _data?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'$SingleSectionSuccessResponseBodyAllOf',
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
