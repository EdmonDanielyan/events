import 'package:test/test.dart';
import 'package:openapi/openapi.dart';

// tests for UserProfileBadge
void main() {
  final instance = UserProfileBadgeBuilder();
  // TODO add properties to the builder and call build()

  group(UserProfileBadge, () {
    // Символьный код (ниже первого уровня не уникальный)
    // String code
    test('to test the property `code`', () async {
      // TODO
    });

    // Название
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // Группа (например на доске почёта награды разбиты по категориям)
    // String group
    test('to test the property `group`', () async {
      // TODO
    });

    // Имя ассета иконки
    // String icon
    test('to test the property `icon`', () async {
      // TODO
    });

    // Полный код иконки в svg. Используется, если поле icon не задано.
    // String svg
    test('to test the property `svg`', () async {
      // TODO
    });

    // Количество, если задано отображается рябом с бейджем
    // num count
    test('to test the property `count`', () async {
      // TODO
    });

    // Короткая текстовая подпись вместо количества (пока не используется)
    // String label
    test('to test the property `label`', () async {
      // TODO
    });

    // Ссылка для перехода на описание статуса (пока не используется)
    // String link
    test('to test the property `link`', () async {
      // TODO
    });

    // Доп. данные для уникальных случаев
    // JsonObject extra
    test('to test the property `extra`', () async {
      // TODO
    });

    // Датализация для \"составных\" статусов
    // BuiltList<UserProfileBadge> subs
    test('to test the property `subs`', () async {
      // TODO
    });

  });
}
