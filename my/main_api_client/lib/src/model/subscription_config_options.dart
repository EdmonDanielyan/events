//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'subscription_config_options.g.dart';

/// SubscriptionConfigOptions
///
/// Properties:
/// * [title] - Заголовок блока
/// * [displayMode] - Режим отображения
/// * [forGroup] - Отображать опции для всей заявки
/// * [forChildren] - Отображать опции в писке детей
/// * [multiSelect] - Выбор нескольких опций
/// * [countManual] - Указывать количество использованных мест вручную
/// * [countSelf] - Записывающийся занимает место. Не учитывается, если включено countManual.
/// * [countChildren] - Дети занимают места. Не учитывается, если включено countManual.
/// * [countVisitor] - 3-е лица занимают места. Не учитывается, если включено countManual.
@BuiltValue()
abstract class SubscriptionConfigOptions implements Built<SubscriptionConfigOptions, SubscriptionConfigOptionsBuilder> {
  /// Заголовок блока
  @BuiltValueField(wireName: r'title')
  String get title;

  /// Режим отображения
  @BuiltValueField(wireName: r'displayMode')
  SubscriptionConfigOptionsDisplayModeEnum get displayMode;
  // enum displayModeEnum {  TEXT,  CALENDAR,  };

  /// Отображать опции для всей заявки
  @BuiltValueField(wireName: r'forGroup')
  bool get forGroup;

  /// Отображать опции в писке детей
  @BuiltValueField(wireName: r'forChildren')
  bool get forChildren;

  /// Выбор нескольких опций
  @BuiltValueField(wireName: r'multiSelect')
  bool get multiSelect;

  /// Указывать количество использованных мест вручную
  @BuiltValueField(wireName: r'countManual')
  bool get countManual;

  /// Записывающийся занимает место. Не учитывается, если включено countManual.
  @BuiltValueField(wireName: r'countSelf')
  bool get countSelf;

  /// Дети занимают места. Не учитывается, если включено countManual.
  @BuiltValueField(wireName: r'countChildren')
  bool get countChildren;

  /// 3-е лица занимают места. Не учитывается, если включено countManual.
  @BuiltValueField(wireName: r'countVisitor')
  bool get countVisitor;

  SubscriptionConfigOptions._();

  factory SubscriptionConfigOptions([void updates(SubscriptionConfigOptionsBuilder b)]) = _$SubscriptionConfigOptions;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SubscriptionConfigOptionsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SubscriptionConfigOptions> get serializer => _$SubscriptionConfigOptionsSerializer();
}

class _$SubscriptionConfigOptionsSerializer implements PrimitiveSerializer<SubscriptionConfigOptions> {
  @override
  final Iterable<Type> types = const [SubscriptionConfigOptions, _$SubscriptionConfigOptions];

  @override
  final String wireName = r'SubscriptionConfigOptions';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SubscriptionConfigOptions object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'title';
    yield serializers.serialize(
      object.title,
      specifiedType: const FullType(String),
    );
    yield r'displayMode';
    yield serializers.serialize(
      object.displayMode,
      specifiedType: const FullType(SubscriptionConfigOptionsDisplayModeEnum),
    );
    yield r'forGroup';
    yield serializers.serialize(
      object.forGroup,
      specifiedType: const FullType(bool),
    );
    yield r'forChildren';
    yield serializers.serialize(
      object.forChildren,
      specifiedType: const FullType(bool),
    );
    yield r'multiSelect';
    yield serializers.serialize(
      object.multiSelect,
      specifiedType: const FullType(bool),
    );
    yield r'countManual';
    yield serializers.serialize(
      object.countManual,
      specifiedType: const FullType(bool),
    );
    yield r'countSelf';
    yield serializers.serialize(
      object.countSelf,
      specifiedType: const FullType(bool),
    );
    yield r'countChildren';
    yield serializers.serialize(
      object.countChildren,
      specifiedType: const FullType(bool),
    );
    yield r'countVisitor';
    yield serializers.serialize(
      object.countVisitor,
      specifiedType: const FullType(bool),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SubscriptionConfigOptions object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SubscriptionConfigOptionsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'displayMode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SubscriptionConfigOptionsDisplayModeEnum),
          ) as SubscriptionConfigOptionsDisplayModeEnum;
          result.displayMode = valueDes;
          break;
        case r'forGroup':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.forGroup = valueDes;
          break;
        case r'forChildren':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.forChildren = valueDes;
          break;
        case r'multiSelect':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.multiSelect = valueDes;
          break;
        case r'countManual':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.countManual = valueDes;
          break;
        case r'countSelf':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.countSelf = valueDes;
          break;
        case r'countChildren':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.countChildren = valueDes;
          break;
        case r'countVisitor':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.countVisitor = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SubscriptionConfigOptions deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SubscriptionConfigOptionsBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

class SubscriptionConfigOptionsDisplayModeEnum extends EnumClass {

  /// Режим отображения
  @BuiltValueEnumConst(wireName: r'TEXT')
  static const SubscriptionConfigOptionsDisplayModeEnum TEXT = _$subscriptionConfigOptionsDisplayModeEnum_TEXT;
  /// Режим отображения
  @BuiltValueEnumConst(wireName: r'CALENDAR')
  static const SubscriptionConfigOptionsDisplayModeEnum CALENDAR = _$subscriptionConfigOptionsDisplayModeEnum_CALENDAR;

  static Serializer<SubscriptionConfigOptionsDisplayModeEnum> get serializer => _$subscriptionConfigOptionsDisplayModeEnumSerializer;

  const SubscriptionConfigOptionsDisplayModeEnum._(String name): super(name);

  static BuiltSet<SubscriptionConfigOptionsDisplayModeEnum> get values => _$subscriptionConfigOptionsDisplayModeEnumValues;
  static SubscriptionConfigOptionsDisplayModeEnum valueOf(String name) => _$subscriptionConfigOptionsDisplayModeEnumValueOf(name);
}

