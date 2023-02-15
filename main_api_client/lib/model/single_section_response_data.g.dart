// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.6

part of 'single_section_response_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SingleSectionResponseData> _$singleSectionResponseDataSerializer =
    new _$SingleSectionResponseDataSerializer();

class _$SingleSectionResponseDataSerializer
    implements StructuredSerializer<SingleSectionResponseData> {
  @override
  final Iterable<Type> types = const [
    SingleSectionResponseData,
    _$SingleSectionResponseData
  ];
  @override
  final String wireName = 'SingleSectionResponseData';

  @override
  Iterable<Object> serialize(
      Serializers serializers, SingleSectionResponseData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.section;
    if (value != null) {
      result
        ..add('section')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(PageSection)));
    }
    value = object.pages;
    if (value != null) {
      result
        ..add('pages')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Page)])));
    }
    return result;
  }

  @override
  SingleSectionResponseData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SingleSectionResponseDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'section':
          result.section.replace(serializers.deserialize(value,
              specifiedType: const FullType(PageSection)) as PageSection);
          break;
        case 'pages':
          result.pages.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Page)]))
              as BuiltList<Object>);
          break;
      }
    }

    return result.build();
  }
}

class _$SingleSectionResponseData extends SingleSectionResponseData {
  @override
  final PageSection section;
  @override
  final BuiltList<Page> pages;

  factory _$SingleSectionResponseData(
          [void Function(SingleSectionResponseDataBuilder) updates]) =>
      (new SingleSectionResponseDataBuilder()..update(updates))._build();

  _$SingleSectionResponseData._({this.section, this.pages}) : super._();

  @override
  SingleSectionResponseData rebuild(
          void Function(SingleSectionResponseDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SingleSectionResponseDataBuilder toBuilder() =>
      new SingleSectionResponseDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SingleSectionResponseData &&
        section == other.section &&
        pages == other.pages;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, section.hashCode);
    _$hash = $jc(_$hash, pages.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SingleSectionResponseData')
          ..add('section', section)
          ..add('pages', pages))
        .toString();
  }
}

class SingleSectionResponseDataBuilder
    implements
        Builder<SingleSectionResponseData, SingleSectionResponseDataBuilder> {
  _$SingleSectionResponseData _$v;

  PageSectionBuilder _section;
  PageSectionBuilder get section =>
      _$this._section ??= new PageSectionBuilder();
  set section(PageSectionBuilder section) => _$this._section = section;

  ListBuilder<Page> _pages;
  ListBuilder<Page> get pages => _$this._pages ??= new ListBuilder<Page>();
  set pages(ListBuilder<Page> pages) => _$this._pages = pages;

  SingleSectionResponseDataBuilder() {
    SingleSectionResponseData._initializeBuilder(this);
  }

  SingleSectionResponseDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _section = $v.section?.toBuilder();
      _pages = $v.pages?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SingleSectionResponseData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SingleSectionResponseData;
  }

  @override
  void update(void Function(SingleSectionResponseDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  SingleSectionResponseData build() => _build();

  _$SingleSectionResponseData _build() {
    _$SingleSectionResponseData _$result;
    try {
      _$result = _$v ??
          new _$SingleSectionResponseData._(
              section: _section?.build(), pages: _pages?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'section';
        _section?.build();
        _$failedField = 'pages';
        _pages?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SingleSectionResponseData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
