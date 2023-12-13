// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_page_response_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SinglePageResponseData extends SinglePageResponseData {
  @override
  final Page? page;

  factory _$SinglePageResponseData(
          [void Function(SinglePageResponseDataBuilder)? updates]) =>
      (new SinglePageResponseDataBuilder()..update(updates))._build();

  _$SinglePageResponseData._({this.page}) : super._();

  @override
  SinglePageResponseData rebuild(
          void Function(SinglePageResponseDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SinglePageResponseDataBuilder toBuilder() =>
      new SinglePageResponseDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SinglePageResponseData && page == other.page;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SinglePageResponseData')
          ..add('page', page))
        .toString();
  }
}

class SinglePageResponseDataBuilder
    implements Builder<SinglePageResponseData, SinglePageResponseDataBuilder> {
  _$SinglePageResponseData? _$v;

  PageBuilder? _page;
  PageBuilder get page => _$this._page ??= new PageBuilder();
  set page(PageBuilder? page) => _$this._page = page;

  SinglePageResponseDataBuilder() {
    SinglePageResponseData._defaults(this);
  }

  SinglePageResponseDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _page = $v.page?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SinglePageResponseData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SinglePageResponseData;
  }

  @override
  void update(void Function(SinglePageResponseDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SinglePageResponseData build() => _build();

  _$SinglePageResponseData _build() {
    _$SinglePageResponseData _$result;
    try {
      _$result = _$v ?? new _$SinglePageResponseData._(page: _page?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'page';
        _page?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SinglePageResponseData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
