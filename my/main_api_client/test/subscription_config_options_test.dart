import 'package:test/test.dart';
import 'package:openapi/openapi.dart';

// tests for SubscriptionConfigOptions
void main() {
  final instance = SubscriptionConfigOptionsBuilder();
  // TODO add properties to the builder and call build()

  group(SubscriptionConfigOptions, () {
    // Заголовок блока
    // String title
    test('to test the property `title`', () async {
      // TODO
    });

    // Режим отображения
    // String displayMode
    test('to test the property `displayMode`', () async {
      // TODO
    });

    // Отображать опции для всей заявки
    // bool forGroup
    test('to test the property `forGroup`', () async {
      // TODO
    });

    // Отображать опции в писке детей
    // bool forChildren
    test('to test the property `forChildren`', () async {
      // TODO
    });

    // Выбор нескольких опций
    // bool multiSelect
    test('to test the property `multiSelect`', () async {
      // TODO
    });

    // Указывать количество использованных мест вручную
    // bool countManual
    test('to test the property `countManual`', () async {
      // TODO
    });

    // Записывающийся занимает место. Не учитывается, если включено countManual.
    // bool countSelf
    test('to test the property `countSelf`', () async {
      // TODO
    });

    // Дети занимают места. Не учитывается, если включено countManual.
    // bool countChildren
    test('to test the property `countChildren`', () async {
      // TODO
    });

    // 3-е лица занимают места. Не учитывается, если включено countManual.
    // bool countVisitor
    test('to test the property `countVisitor`', () async {
      // TODO
    });

  });
}
