// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snippet_list_response_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SnippetListResponseData extends SnippetListResponseData {
  @override
  final BuiltList<Snippet>? snippets;

  factory _$SnippetListResponseData(
          [void Function(SnippetListResponseDataBuilder)? updates]) =>
      (new SnippetListResponseDataBuilder()..update(updates))._build();

  _$SnippetListResponseData._({this.snippets}) : super._();

  @override
  SnippetListResponseData rebuild(
          void Function(SnippetListResponseDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SnippetListResponseDataBuilder toBuilder() =>
      new SnippetListResponseDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SnippetListResponseData && snippets == other.snippets;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, snippets.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SnippetListResponseData')
          ..add('snippets', snippets))
        .toString();
  }
}

class SnippetListResponseDataBuilder
    implements
        Builder<SnippetListResponseData, SnippetListResponseDataBuilder> {
  _$SnippetListResponseData? _$v;

  ListBuilder<Snippet>? _snippets;
  ListBuilder<Snippet> get snippets =>
      _$this._snippets ??= new ListBuilder<Snippet>();
  set snippets(ListBuilder<Snippet>? snippets) => _$this._snippets = snippets;

  SnippetListResponseDataBuilder() {
    SnippetListResponseData._defaults(this);
  }

  SnippetListResponseDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _snippets = $v.snippets?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SnippetListResponseData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SnippetListResponseData;
  }

  @override
  void update(void Function(SnippetListResponseDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SnippetListResponseData build() => _build();

  _$SnippetListResponseData _build() {
    _$SnippetListResponseData _$result;
    try {
      _$result =
          _$v ?? new _$SnippetListResponseData._(snippets: _snippets?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'snippets';
        _snippets?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SnippetListResponseData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
