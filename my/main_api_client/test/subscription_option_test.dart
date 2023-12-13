import 'package:test/test.dart';
import 'package:openapi/openapi.dart';

// tests for SubscriptionOption
void main() {
  final instance = SubscriptionOptionBuilder();
  // TODO add properties to the builder and call build()

  group(SubscriptionOption, () {
    // IВ
    // String id
    test('to test the property `id`', () async {
      // TODO
    });

    // Заголовок
    // String title
    test('to test the property `title`', () async {
      // TODO
    });

    // Описание
    // String description
    test('to test the property `description`', () async {
      // TODO
    });

    // Картинка
    // String image
    test('to test the property `image`', () async {
      // TODO
    });

    // Мест всего (null - не ограниченно)
    // int limit
    test('to test the property `limit`', () async {
      // TODO
    });

    // Мест осталось (null - не ограниченно)
    // int left
    test('to test the property `left`', () async {
      // TODO
    });

    // Дата и время начала (для режима календаря)
    // DateTime dateStart
    test('to test the property `dateStart`', () async {
      // TODO
    });

    // Дата и время окончания (для режима календаря)
    // DateTime dateEnd
    test('to test the property `dateEnd`', () async {
      // TODO
    });

    // Доступно для выбора. Если null - считать как true. Если false - отобразить, но не давать выбрать.
    // bool available
    test('to test the property `available`', () async {
      // TODO
    });

  });
}
