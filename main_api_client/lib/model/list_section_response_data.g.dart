// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'list_section_response_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ListSectionResponseData> _$listSectionResponseDataSerializer =
    new _$ListSectionResponseDataSerializer();

class _$ListSectionResponseDataSerializer
    implements StructuredSerializer<ListSectionResponseData> {
  @override
  final Iterable<Type> types = const [
    ListSectionResponseData,
    _$ListSectionResponseData
  ];
  @override
  final String wireName = 'ListSectionResponseData';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ListSectionResponseData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.sections;
    if (value != null) {
      result
        ..add('sections')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(PageSection)])));
    }
    return result;
  }

  @override
  ListSectionResponseData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ListSectionResponseDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'sections':
          result.sections.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(PageSection)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$ListSectionResponseData extends ListSectionResponseData {
  @override
  final BuiltList<PageSection> sections;

  factory _$ListSectionResponseData(
          [void Function(ListSectionResponseDataBuilder) updates]) =>
      (new ListSectionResponseDataBuilder()..update(updates))._build();

  _$ListSectionResponseData._({this.sections}) : super._();

  @override
  ListSectionResponseData rebuild(
          void Function(ListSectionResponseDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListSectionResponseDataBuilder toBuilder() =>
      new ListSectionResponseDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListSectionResponseData && sections == other.sections;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, sections.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ListSectionResponseData')
          ..add('sections', sections))
        .toString();
  }
}

class ListSectionResponseDataBuilder
    implements
        Builder<ListSectionResponseData, ListSectionResponseDataBuilder> {
  _$ListSectionResponseData _$v;

  ListBuilder<PageSection> _sections;
  ListBuilder<PageSection> get sections =>
      _$this._sections ??= new ListBuilder<PageSection>();
  set sections(ListBuilder<PageSection> sections) =>
      _$this._sections = sections;

  ListSectionResponseDataBuilder() {
    ListSectionResponseData._initializeBuilder(this);
  }

  ListSectionResponseDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sections = $v.sections?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ListSectionResponseData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ListSectionResponseData;
  }

  @override
  void update(void Function(ListSectionResponseDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ListSectionResponseData build() => _build();

  _$ListSectionResponseData _build() {
    _$ListSectionResponseData _$result;
    try {
      _$result =
          _$v ?? new _$ListSectionResponseData._(sections: _sections?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'sections';
        _sections?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ListSectionResponseData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
