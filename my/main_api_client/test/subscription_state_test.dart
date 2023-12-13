import 'package:test/test.dart';
import 'package:openapi/openapi.dart';

// tests for SubscriptionState
void main() {
  final instance = SubscriptionStateBuilder();
  // TODO add properties to the builder and call build()

  group(SubscriptionState, () {
    // Версия формата
    // int v
    test('to test the property `v`', () async {
      // TODO
    });

    // ID события записи
    // String id
    test('to test the property `id`', () async {
      // TODO
    });

    // Пользователь подписан на событие
    // bool subscribed
    test('to test the property `subscribed`', () async {
      // TODO
    });

    // Можно записаться на событие
    // bool canSubscribe
    test('to test the property `canSubscribe`', () async {
      // TODO
    });

    // Можно отменить запись
    // bool canUnsubscribe
    test('to test the property `canUnsubscribe`', () async {
      // TODO
    });

    // Доп. сообщение с причиной невозможности подписки/отписки
    // String statusMessage
    test('to test the property `statusMessage`', () async {
      // TODO
    });

    // SubscriptionConfig config
    test('to test the property `config`', () async {
      // TODO
    });

    // Поля формы записи (если доступна запись)
    // BuiltList<SubscriptionField> fields
    test('to test the property `fields`', () async {
      // TODO
    });

    // Опции формы записи (если доступна запись)
    // BuiltList<SubscriptionOption> options
    test('to test the property `options`', () async {
      // TODO
    });

    // Ссылки на файлы с билетами (если записан)
    // BuiltList<String> tickets
    test('to test the property `tickets`', () async {
      // TODO
    });

    // Количество мест (для отладки)
    // int placesLimit
    test('to test the property `placesLimit`', () async {
      // TODO
    });

    // Количество свободных мест (для отладки)
    // int placesLeft
    test('to test the property `placesLeft`', () async {
      // TODO
    });

  });
}
