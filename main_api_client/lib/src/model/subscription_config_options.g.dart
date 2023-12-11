// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_config_options.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SubscriptionConfigOptionsDisplayModeEnum
    _$subscriptionConfigOptionsDisplayModeEnum_TEXT =
    const SubscriptionConfigOptionsDisplayModeEnum._('TEXT');
const SubscriptionConfigOptionsDisplayModeEnum
    _$subscriptionConfigOptionsDisplayModeEnum_CALENDAR =
    const SubscriptionConfigOptionsDisplayModeEnum._('CALENDAR');

SubscriptionConfigOptionsDisplayModeEnum
    _$subscriptionConfigOptionsDisplayModeEnumValueOf(String name) {
  switch (name) {
    case 'TEXT':
      return _$subscriptionConfigOptionsDisplayModeEnum_TEXT;
    case 'CALENDAR':
      return _$subscriptionConfigOptionsDisplayModeEnum_CALENDAR;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<SubscriptionConfigOptionsDisplayModeEnum>
    _$subscriptionConfigOptionsDisplayModeEnumValues = new BuiltSet<
        SubscriptionConfigOptionsDisplayModeEnum>(const <SubscriptionConfigOptionsDisplayModeEnum>[
  _$subscriptionConfigOptionsDisplayModeEnum_TEXT,
  _$subscriptionConfigOptionsDisplayModeEnum_CALENDAR,
]);

Serializer<SubscriptionConfigOptionsDisplayModeEnum>
    _$subscriptionConfigOptionsDisplayModeEnumSerializer =
    new _$SubscriptionConfigOptionsDisplayModeEnumSerializer();

class _$SubscriptionConfigOptionsDisplayModeEnumSerializer
    implements PrimitiveSerializer<SubscriptionConfigOptionsDisplayModeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'TEXT': 'TEXT',
    'CALENDAR': 'CALENDAR',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'TEXT': 'TEXT',
    'CALENDAR': 'CALENDAR',
  };

  @override
  final Iterable<Type> types = const <Type>[
    SubscriptionConfigOptionsDisplayModeEnum
  ];
  @override
  final String wireName = 'SubscriptionConfigOptionsDisplayModeEnum';

  @override
  Object serialize(Serializers serializers,
          SubscriptionConfigOptionsDisplayModeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SubscriptionConfigOptionsDisplayModeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SubscriptionConfigOptionsDisplayModeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$SubscriptionConfigOptions extends SubscriptionConfigOptions {
  @override
  final String title;
  @override
  final SubscriptionConfigOptionsDisplayModeEnum displayMode;
  @override
  final bool forGroup;
  @override
  final bool forChildren;
  @override
  final bool multiSelect;
  @override
  final bool countManual;
  @override
  final bool countSelf;
  @override
  final bool countChildren;
  @override
  final bool countVisitor;

  factory _$SubscriptionConfigOptions(
          [void Function(SubscriptionConfigOptionsBuilder)? updates]) =>
      (new SubscriptionConfigOptionsBuilder()..update(updates))._build();

  _$SubscriptionConfigOptions._(
      {required this.title,
      required this.displayMode,
      required this.forGroup,
      required this.forChildren,
      required this.multiSelect,
      required this.countManual,
      required this.countSelf,
      required this.countChildren,
      required this.countVisitor})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        title, r'SubscriptionConfigOptions', 'title');
    BuiltValueNullFieldError.checkNotNull(
        displayMode, r'SubscriptionConfigOptions', 'displayMode');
    BuiltValueNullFieldError.checkNotNull(
        forGroup, r'SubscriptionConfigOptions', 'forGroup');
    BuiltValueNullFieldError.checkNotNull(
        forChildren, r'SubscriptionConfigOptions', 'forChildren');
    BuiltValueNullFieldError.checkNotNull(
        multiSelect, r'SubscriptionConfigOptions', 'multiSelect');
    BuiltValueNullFieldError.checkNotNull(
        countManual, r'SubscriptionConfigOptions', 'countManual');
    BuiltValueNullFieldError.checkNotNull(
        countSelf, r'SubscriptionConfigOptions', 'countSelf');
    BuiltValueNullFieldError.checkNotNull(
        countChildren, r'SubscriptionConfigOptions', 'countChildren');
    BuiltValueNullFieldError.checkNotNull(
        countVisitor, r'SubscriptionConfigOptions', 'countVisitor');
  }

  @override
  SubscriptionConfigOptions rebuild(
          void Function(SubscriptionConfigOptionsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscriptionConfigOptionsBuilder toBuilder() =>
      new SubscriptionConfigOptionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubscriptionConfigOptions &&
        title == other.title &&
        displayMode == other.displayMode &&
        forGroup == other.forGroup &&
        forChildren == other.forChildren &&
        multiSelect == other.multiSelect &&
        countManual == other.countManual &&
        countSelf == other.countSelf &&
        countChildren == other.countChildren &&
        countVisitor == other.countVisitor;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, displayMode.hashCode);
    _$hash = $jc(_$hash, forGroup.hashCode);
    _$hash = $jc(_$hash, forChildren.hashCode);
    _$hash = $jc(_$hash, multiSelect.hashCode);
    _$hash = $jc(_$hash, countManual.hashCode);
    _$hash = $jc(_$hash, countSelf.hashCode);
    _$hash = $jc(_$hash, countChildren.hashCode);
    _$hash = $jc(_$hash, countVisitor.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SubscriptionConfigOptions')
          ..add('title', title)
          ..add('displayMode', displayMode)
          ..add('forGroup', forGroup)
          ..add('forChildren', forChildren)
          ..add('multiSelect', multiSelect)
          ..add('countManual', countManual)
          ..add('countSelf', countSelf)
          ..add('countChildren', countChildren)
          ..add('countVisitor', countVisitor))
        .toString();
  }
}

class SubscriptionConfigOptionsBuilder
    implements
        Builder<SubscriptionConfigOptions, SubscriptionConfigOptionsBuilder> {
  _$SubscriptionConfigOptions? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  SubscriptionConfigOptionsDisplayModeEnum? _displayMode;
  SubscriptionConfigOptionsDisplayModeEnum? get displayMode =>
      _$this._displayMode;
  set displayMode(SubscriptionConfigOptionsDisplayModeEnum? displayMode) =>
      _$this._displayMode = displayMode;

  bool? _forGroup;
  bool? get forGroup => _$this._forGroup;
  set forGroup(bool? forGroup) => _$this._forGroup = forGroup;

  bool? _forChildren;
  bool? get forChildren => _$this._forChildren;
  set forChildren(bool? forChildren) => _$this._forChildren = forChildren;

  bool? _multiSelect;
  bool? get multiSelect => _$this._multiSelect;
  set multiSelect(bool? multiSelect) => _$this._multiSelect = multiSelect;

  bool? _countManual;
  bool? get countManual => _$this._countManual;
  set countManual(bool? countManual) => _$this._countManual = countManual;

  bool? _countSelf;
  bool? get countSelf => _$this._countSelf;
  set countSelf(bool? countSelf) => _$this._countSelf = countSelf;

  bool? _countChildren;
  bool? get countChildren => _$this._countChildren;
  set countChildren(bool? countChildren) =>
      _$this._countChildren = countChildren;

  bool? _countVisitor;
  bool? get countVisitor => _$this._countVisitor;
  set countVisitor(bool? countVisitor) => _$this._countVisitor = countVisitor;

  SubscriptionConfigOptionsBuilder() {
    SubscriptionConfigOptions._defaults(this);
  }

  SubscriptionConfigOptionsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _displayMode = $v.displayMode;
      _forGroup = $v.forGroup;
      _forChildren = $v.forChildren;
      _multiSelect = $v.multiSelect;
      _countManual = $v.countManual;
      _countSelf = $v.countSelf;
      _countChildren = $v.countChildren;
      _countVisitor = $v.countVisitor;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubscriptionConfigOptions other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubscriptionConfigOptions;
  }

  @override
  void update(void Function(SubscriptionConfigOptionsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubscriptionConfigOptions build() => _build();

  _$SubscriptionConfigOptions _build() {
    final _$result = _$v ??
        new _$SubscriptionConfigOptions._(
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'SubscriptionConfigOptions', 'title'),
            displayMode: BuiltValueNullFieldError.checkNotNull(
                displayMode, r'SubscriptionConfigOptions', 'displayMode'),
            forGroup: BuiltValueNullFieldError.checkNotNull(
                forGroup, r'SubscriptionConfigOptions', 'forGroup'),
            forChildren: BuiltValueNullFieldError.checkNotNull(
                forChildren, r'SubscriptionConfigOptions', 'forChildren'),
            multiSelect: BuiltValueNullFieldError.checkNotNull(
                multiSelect, r'SubscriptionConfigOptions', 'multiSelect'),
            countManual: BuiltValueNullFieldError.checkNotNull(
                countManual, r'SubscriptionConfigOptions', 'countManual'),
            countSelf: BuiltValueNullFieldError.checkNotNull(
                countSelf, r'SubscriptionConfigOptions', 'countSelf'),
            countChildren: BuiltValueNullFieldError.checkNotNull(
                countChildren, r'SubscriptionConfigOptions', 'countChildren'),
            countVisitor: BuiltValueNullFieldError.checkNotNull(countVisitor, r'SubscriptionConfigOptions', 'countVisitor'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
