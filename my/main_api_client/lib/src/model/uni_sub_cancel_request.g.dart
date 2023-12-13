// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uni_sub_cancel_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UniSubCancelRequest extends UniSubCancelRequest {
  @override
  final String? reason;

  factory _$UniSubCancelRequest(
          [void Function(UniSubCancelRequestBuilder)? updates]) =>
      (new UniSubCancelRequestBuilder()..update(updates))._build();

  _$UniSubCancelRequest._({this.reason}) : super._();

  @override
  UniSubCancelRequest rebuild(
          void Function(UniSubCancelRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UniSubCancelRequestBuilder toBuilder() =>
      new UniSubCancelRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UniSubCancelRequest && reason == other.reason;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UniSubCancelRequest')
          ..add('reason', reason))
        .toString();
  }
}

class UniSubCancelRequestBuilder
    implements Builder<UniSubCancelRequest, UniSubCancelRequestBuilder> {
  _$UniSubCancelRequest? _$v;

  String? _reason;
  String? get reason => _$this._reason;
  set reason(String? reason) => _$this._reason = reason;

  UniSubCancelRequestBuilder() {
    UniSubCancelRequest._defaults(this);
  }

  UniSubCancelRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _reason = $v.reason;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UniSubCancelRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UniSubCancelRequest;
  }

  @override
  void update(void Function(UniSubCancelRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UniSubCancelRequest build() => _build();

  _$UniSubCancelRequest _build() {
    final _$result = _$v ?? new _$UniSubCancelRequest._(reason: reason);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
