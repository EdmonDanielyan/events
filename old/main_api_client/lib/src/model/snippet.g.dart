// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snippet.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SnippetTypeEnum _$snippetTypeEnum_text = const SnippetTypeEnum._('text');
const SnippetTypeEnum _$snippetTypeEnum_html = const SnippetTypeEnum._('html');

SnippetTypeEnum _$snippetTypeEnumValueOf(String name) {
  switch (name) {
    case 'text':
      return _$snippetTypeEnum_text;
    case 'html':
      return _$snippetTypeEnum_html;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<SnippetTypeEnum> _$snippetTypeEnumValues =
    new BuiltSet<SnippetTypeEnum>(const <SnippetTypeEnum>[
  _$snippetTypeEnum_text,
  _$snippetTypeEnum_html,
]);

Serializer<SnippetTypeEnum> _$snippetTypeEnumSerializer =
    new _$SnippetTypeEnumSerializer();

class _$SnippetTypeEnumSerializer
    implements PrimitiveSerializer<SnippetTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'text': 'text',
    'html': 'html',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'text': 'text',
    'html': 'html',
  };

  @override
  final Iterable<Type> types = const <Type>[SnippetTypeEnum];
  @override
  final String wireName = 'SnippetTypeEnum';

  @override
  Object serialize(Serializers serializers, SnippetTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SnippetTypeEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SnippetTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$Snippet extends Snippet {
  @override
  final SnippetTypeEnum? type;
  @override
  final String? code;
  @override
  final String? text;

  factory _$Snippet([void Function(SnippetBuilder)? updates]) =>
      (new SnippetBuilder()..update(updates))._build();

  _$Snippet._({this.type, this.code, this.text}) : super._();

  @override
  Snippet rebuild(void Function(SnippetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SnippetBuilder toBuilder() => new SnippetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Snippet &&
        type == other.type &&
        code == other.code &&
        text == other.text;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Snippet')
          ..add('type', type)
          ..add('code', code)
          ..add('text', text))
        .toString();
  }
}

class SnippetBuilder implements Builder<Snippet, SnippetBuilder> {
  _$Snippet? _$v;

  SnippetTypeEnum? _type;
  SnippetTypeEnum? get type => _$this._type;
  set type(SnippetTypeEnum? type) => _$this._type = type;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  SnippetBuilder() {
    Snippet._defaults(this);
  }

  SnippetBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _code = $v.code;
      _text = $v.text;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Snippet other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Snippet;
  }

  @override
  void update(void Function(SnippetBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Snippet build() => _build();

  _$Snippet _build() {
    final _$result = _$v ?? new _$Snippet._(type: type, code: code, text: text);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
